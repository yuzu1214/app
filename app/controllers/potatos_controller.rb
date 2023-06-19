class PotatosController < ApplicationController

    def index
        @potatos = Potato.all
        @tag_list = Tag.all.sort {|a,b| b.potatos.count <=> a.potatos.count} 
        if params[:search] != nil && params[:search] != ''
        search = params[:search]
        @potatos = Potato.joins(:tags).where("body LIKE ? OR tag_name LIKE ?", "%#{search}%", "%#{search}%")
        else
        @potatos = Potato.all
        end
        if params[:tag_id]
        @potatos = []
        params[:tag_id].each do |key, value|      
            @potatos += Tag.find_by(tag_name: key).potatos if value == "1"
        end
        @potatos.uniq!
        end
    end

    def new
      @potato = Potato.new
    end

    def create
        potato = current_user.potatos.new(potato_params)           
        tag_list = params[:potato][:tag_name].split(',')

        if potato.save!
           potato.save_tag(tag_list)
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
      @potato = Potato.find(params[:id])
      @potato_tags = @potato.tags
      @comments = @potato.comments
      @comment = Comment.new
    end

    def edit
        @potato = Potato.find(params[:id])
        @tag_list=@potato.tags.pluck(:tag_name).join(nil)
    end

    def update

        potato = Potato.find(params[:id])
        tag_list = params[:potato][:tag_name].split(nil)
        if potato.update(potato_params)
            old_relations = TagMap.where(potato_id: potato.id)
            old_relations.each do |relation|
              relation.delete
        end

          potato.save_tag(tag_list)
          redirect_to potato_path(potato.id), notice:'投稿完了しました:)'
        else
          redirect_to :action => "edit"
        end
    end

    def destroy
        potato = Potato.find(params[:id])
        potato.destroy
        redirect_to action: :index
    end


    private
      def potato_params
        params.require(:potato).permit(:recipe_name, :recipe_abput, :image)
      end

end
