class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    if @book.save
     flash[:notice] = "It was successfully!!"
     redirect_to book_path(@book.id)
    else
     @books=Book.all
     flash[:alert] = "It didn't go successfully..."
     render :index
    end

  end

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    book=Book.find(params[:id])
    if book.update(book_params)
      flash[:success] = "The update was successfully!!"
      redirect_to book_path(book.id)
    else

      flash[:alert] = "It didn't go successfully..."
      redirect_to edit_book_path(book.id)
    end
  end

  def destroy
    book=Book.find(params[:id])
    if book.destroy
      flash[:destroy] = "The deletion was successfully!!"
      redirect_to '/books'
    else
      flash[:alert] =  "It didn't go successfully..."
      redirect_to '/books'
    end

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)

  end
end
