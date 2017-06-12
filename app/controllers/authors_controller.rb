class AuthorsController < ApplicationController
	def index
		@authors = Author.all
	end

	def show
		@author = Author.find(params[:id])
		@books = @author.books
	end

	def new
		@author = Author.new
	end

	def create
		@author = Author.new(author_params)

		if @author.save
			flash[:success] = "Author was created successfully"
			redirect_to authors_path
		else
			render :new
		end
	end

	def edit
		@author = Author.find(params[:id])
	end

	def update
		@author = Author.find(params[:id])
		if @author.update(author_params)
			flash[:success] = "Author was updated successfully"
			redirect_to authors_path
		else
			render :edit
		end
	end

	def destroy
		Author.find(params[:id]).destroy
		flash[:success] = "Author was deleted successfully"
		redirect_to authors_path
	end

	private
		def author_params
			params.require(:author).permit(:name, :email)
		end
end
