class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    
    redirect_to post_path(comment_params[:post_id]) , notice: "El comentario fue publicado con éxito"
  end

  private
		def comment_params
			params.require(:comment).permit(:body, :post_id, :user_id)
		end
end
