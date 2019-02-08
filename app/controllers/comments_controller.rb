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
#   def create
#     @comment = Comment.new(comment_params)
#     if @comment.save
#       flash[:success] = "Comentario añadido exitosamente!"
#     else
#       flash[:danger] = @comment.errors.full_messages.to_sentence
#     end
#       redirect_to post_path(comment_params[:post_id])
#   end
#
# private
#   def comment_params
#     params.require(:comment).permit(:body, :post_id, :user_id)
#   end
end
