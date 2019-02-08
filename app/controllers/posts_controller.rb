class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:show, :index]
  before_action :find_post, :except => [:index, :new, :create]

  def index
    @posts = Post.order("updated_at DESC")
  end
#agregado form_for
  def show
      @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post[:user_id] = current_user[:id]
    if @post.save
      flash[:notice] = "Post creado exitosamente!"
      redirect_to posts_path
    else
      flash[:danger] = @post.errors.full_messages
      render :new
    end
  end

  # def edit
  #   @post = Post.find(params[:id])
  # end

  def update
    if @post.update(post_params)
      flash[:success] = "Post modificado exitosamente!"
      redirect_to posts_path
    else
      flash[:danger] =  @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:danger] = "Post ELIMINADO"

    redirect_to posts_path
  end

  private
  #crea metodo para verificar
      def find_post
        @post = Post.find(params[:id])
      end
      def post_params
        params.require(:post).permit(:title, :body, :user_id)
      end
end
