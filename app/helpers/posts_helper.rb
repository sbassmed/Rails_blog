module PostsHelper
  def form_title
		@post.new_record? ? "Crear Post" : "Modificar Post"
	end
end
