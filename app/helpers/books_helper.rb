module BooksHelper
  def latest_sells(book)
    book.sells.pluck(:quantity)
  end
end
