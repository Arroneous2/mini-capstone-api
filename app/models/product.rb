class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, comparison: {greater_than: 0} 
  belongs_to :supplier  

  # returns true if an item is less than or equal to $10 and false otherwise.
  def is_discounted
    return price <= 10
  end

  #return the tax that would be charged for a particular product. (Assume a 9% tax rate.)
  def tax
    return price * 0.09
  end

  #return the sum of the price + tax
  def total
    return price + tax
  end
end
