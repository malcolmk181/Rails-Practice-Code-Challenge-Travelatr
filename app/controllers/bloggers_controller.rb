class BloggersController < ApplicationController
    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
        @featured = @blogger.posts.order(likes: :desc).first
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)

        if @blogger.save
            flash[:notice] = 'Blogger was successfully created.'
            redirect_to @blogger
        else
            flash[:error] = 'Blogger was not created.'
            render "new"
        end 
        
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end