class CommentsController < ApplicationController

  before_action :authenticate_user!
  
  def create
    post = Post.find(params[:post_id])
    post.comments.create(comments_params)
      redirect_to post , notice: "El comentario fue publicado con éxito"
  end

  private
		def comment_params
			params.require(:comment).permit(:body, :post_id, :user_id)
		end
end
