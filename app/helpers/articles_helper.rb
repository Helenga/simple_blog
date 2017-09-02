module ArticlesHelper
	def require_login
		unless logged_in?
			flash[:error] = 'You must be logged in'
			redirect_to login_path
		end
	end
	
	private
	def article_params
		params.require(:article).permit(:title, :text, :tag_list, :image)
	end

end
