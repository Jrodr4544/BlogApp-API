class Api::PostsController < ApplicationController
        before_action :set_post, only: [:add_comment]

    def index
      # binding.pry
      @posts = Post.all
      render :json => @posts, include: ['comments'] 
    end

    def add_comment
      @post.comments.create(name: params[:name],content: params[:content])
      #binding.pry
      if @post.save
        # binding.pry
        render :json => @post, include: ['comments']
      else
        render json: @post, status: 404
      end
    end

    private
  
      def set_post
        @post = Post.find(params[:post_id])
      end

      def post_params 
        params.require(:post).permit!
      end
end
