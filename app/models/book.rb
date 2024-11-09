class Book < ApplicationRecord
  validates_presence_of :name, :price

  has_many :sells
end
