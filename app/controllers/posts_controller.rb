class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
      @comment = Comment.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post modificado exitosamente!"
      redirect_to posts_path
    else
      flash[:danger] = "No se pudo modificar el post"
      render :edit
    end
  end

  def destroy
      if @post.destroy
        flash[:success] = "Post eliminado exitosamente!"
        redirect_to posts_path
      else
        flash[:danger] = "No se pudo eliminar el post"
        render :index
      end
    end

  private

      def post_params
        params.require(:post).permit(:title, :body, :user_id)
      end
end
