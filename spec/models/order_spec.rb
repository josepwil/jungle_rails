require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @category = Category.new({ name: 'Test'})
      @category.save!
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(
        name: 'Product One',
        price: 200,
        quantity: 5,
        category_id: @category.id
      )
      @product2 = Product.create!(
        name: 'Product Two',
        price: 350,
        quantity: 3,
        category_id: @category.id
      )
      # Setup at least one product that will NOT be in the order
      @product3 = Product.create!(
        name: 'Product Three',
        price: 150,
        quantity: 4,
        category_id: @category.id
      )
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'testEmail@test.com',
        total_cents: 550,
        stripe_charge_id: 5, # returned by stripe
      )
      # 2. build line items on @order
      cart = [@product1, @product2]
      cart.each do |entry|
        product = entry[:product]
        quantity = entry[:quantity]
        @order.line_items.new(
          product: entry,
          quantity: 1,
          item_price: entry.price,
          total_price: entry.price * quantity
        )
      end
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eql(4)
      expect(@product2.quantity).to eql(2)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
            # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'testEmail@test.com',
        total_cents: 550,
        stripe_charge_id: 5, # returned by stripe
      )
      # 2. build line items on @order
      cart = [@product1, @product2]
      cart.each do |entry|
        product = entry[:product]
        quantity = entry[:quantity]
        @order.line_items.new(
          product: entry,
          quantity: 1,
          item_price: entry.price,
          total_price: entry.price * quantity
        )
      end
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product3.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product3.quantity).to eql(4)
    end
  end
end