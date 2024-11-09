class Sell < ApplicationRecord
  DAYS = %W[MONDAY TUESDAY WEDNESDAY THURSDAY FRIDAY SATURDAY SUNDAY].freeze

  validates :quantity, presence: true
  validates :day, inclusion: {in: DAYS}, presence: true

  belongs_to :book

  before_save :calc_total

  private

  def calc_total
    self.total = quantity * book.price
  end
end
