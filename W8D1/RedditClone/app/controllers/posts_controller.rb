class PostsController < ApplicationController
    before_action :require_signed_in!, except: [:show]
    
    def new
        @post = Post.new
    end

    def show
        post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def create
        @post = current_user.posts.new(post_params)
        @post.user_id = current_user.id

        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def update
        @post = Post.find(params[:id])

        if @post.update_attributes(post_params)
            flash[:notices] = ['Post updated.']
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_url
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content, :user_id, :sub_id)
    end
end
