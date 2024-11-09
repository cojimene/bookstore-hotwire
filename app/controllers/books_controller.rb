class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      @book.broadcast_append_to(
        'bookstore_channel',
        partial: 'dashboard/charts/books/chart',
        locals: {book: @book},
        target: 'books_charts'
      )
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :price)
  end
end
