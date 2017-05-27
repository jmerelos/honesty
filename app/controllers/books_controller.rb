class BooksController < ApplicationController
	before_action :require_user, except: [:show, :index]

	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.author = Author.find(1)

		if @book.save
			flash[:success] = "Book was created successfully"
			redirect_to books_path
		else
			render :new
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:success] = "Book was updated successfully"
			redirect_to book_path(@book)
		else
			render :edit
		end
	end

	def destroy
		Book.find(params[:id]).destroy
		flash[:success] = "Book was deleted successfully"
		redirect_to books_path
	end

	private
		def book_params
			params.require(:book).permit(:name, :description)
		end
end
