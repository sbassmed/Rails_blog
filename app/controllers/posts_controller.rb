class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post[:user_id] = current_user[:id]
    if @post.save
      flash[:success] = "Post publicado exitosamente!"
      redirect_to posts_path
    else
      flash[:danger] = @post.errors.full_messages
      render :new
    end
  end

  def show
      @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    @post = Post.update(params[:id], post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path, notice: "El post fue eliminado con éxito"
  end

  private

      def post_params
        params.require(:post).permit(:title, :body, :user_id)
      end
end
