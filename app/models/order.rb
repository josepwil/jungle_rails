class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create do |order|
    items = LineItem.where(order_id: id).all

    items.each do |item|
      product = Product.find(item.product_id)
      newQuantity = product.quantity.to_i - item.quantity
      product.update(quantity: newQuantity)
    end
  end

end
