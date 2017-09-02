class ArticlesController < ApplicationController
	include ArticlesHelper
	
	before_action :require_login, except: [:index, :show]
#	http_basic_authenticate_with name: 'admin', password: 'work', 
#										except: [:index, :show, :new]
	
	def index
		@articles = Article.all
	end
	
	def new
		@article = Article.new
	end
	
	def edit
		@article = Article.find(params[:id])
	end
	
	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end
	
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end
	
	def show
		@article = Article.find(params[:id])
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "#{@article.title} was deleted"
		
		redirect_to articles_path
	end
end
