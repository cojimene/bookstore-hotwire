module SellsHelper
  def sells_per_day
    sells = Sell.group(:day).sum(:quantity)
    sells_ordered = Sell::DAYS.map { |day| sells[day] || 0 }

    [Sell::DAYS, sells_ordered]
  end

  def revenue_from_sells
    sells = Sell.joins(:book).group(:name).sum(:total)
    totals = sells.values.map { |t| t.round(2) }

    [sells.keys, totals]
  end
end
