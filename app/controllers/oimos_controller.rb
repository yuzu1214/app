class OimosController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

    def index
        @oimos = Oimo.all
        @tag_list = Tag.all.sort {|a,b| b.oimos.count <=> a.oimos.count} 
    if params[:search] != nil && params[:search] != ''
      search = params[:search]
      @oimos = Oimo.joins(:tags).where("body LIKE ? OR tag_name LIKE ?", "%#{search}%", "%#{search}%")
    else
      @oimos = Oimo.all
    end
    if params[:tag_id]
      @oimos = []
      params[:tag_id].each do |key, value|      
        @oimos += Tag.find_by(tag_name: key).oimos if value == "1"
      end
      @oimos.uniq!
    end
    end

    def shop_new
        @oimo = Oimo.new
        
      end

      def recipe_new
        @oimo = Oimo.new
        @oimo = current_user.oimos.new
      end

      def create
        oimo = current_user.oimos.new(oimo_params)           
        tag_list = params[:oimo][:tag_name].split(nil)

        if oimo.save!
           oimo.save_tag(tag_list)
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @oimo = Oimo.find(params[:id])
        @oimo_tags = @oimo.tags
        @comments = @oimo.comments
        @comment = Comment.new
      end


      def edit
        @oimo = Oimo.find(params[:id])
        @tag_list=@oimo.tags.pluck(:tag_name).join(nil)
      end

      def update

        oimo = Oimo.find(params[:id])
        tag_list = params[:oimo][:tag_name].split(nil)
          if oimo.update(oimo_params)
            old_relations = TagMap.where(oimo_id: oimo.id)
            old_relations.each do |relation|
              relation.delete
          end

          oimo.save_tag(tag_list)
          redirect_to oimo_path(oimo.id), notice:'投稿完了しました:)'
        else
          redirect_to :action => "edit"
        end
      end

      def destroy
        oimo = Oimo.find(params[:id])
        oimo.destroy
        redirect_to action: :index
      end

      def top
        if params[:search] != nil && params[:search] != ''
          search = params[:search]
          @tag_list = Tag.where("tag_name LIKE ?", "%#{search}%")
        else
          @tag_list = Tag.all
        end
      end

      def shop
        @shop=Oimo.where(shop_or_recipe:'お店')
      end

      def recipe
        @recipe=Oimo.where(shop_or_recipe:'料理')
      end

      def search
        @tag_list = Tag.all               
        @tag = Tag.find(params[:tag_id])  
        @oimos = @tag.oimos.all           
      end  


      private
      def oimo_params
        params.require(:oimo).permit(:shop_or_recipe, :shop_name, :adresses, :shop_about, :image)
      end

end
