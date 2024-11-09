class SellsController < ApplicationController
  def new
    @sell = Sell.new
  end

  def create
    @sell = Sell.new(sell_params)

    if @sell.save
      @sell.broadcast_replace_to(
        'bookstore_channel',
        partial: 'dashboard/charts/days/chart',
        target: 'days_chart'
      )

      @sell.broadcast_replace_to(
        'bookstore_channel',
        partial: 'dashboard/charts/revenue/chart',
        target: 'revenue_chart'
      )

      @sell.broadcast_replace_to(
        'bookstore_channel',
        partial: 'dashboard/charts/books/chart',
        locals: {book: @sell.book},
        target: "book_#{@sell.book_id}_chart"
      )
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def sell_params
    params.require(:sell).permit(:quantity, :book_id, :day)
  end
end
