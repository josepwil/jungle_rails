require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    before(:each) do
      @category = Category.new
      @category.name = "Games"
      @category.save!
      @product = Product.new
      @product.name = "Monopoly"
    end

    it "Should save successfully with four fields set" do
      @product.price = 200
      @product.quantity = 2
      @product.category_id = @category.id
      @product.save!
    end

    it "Should produce a name error if product name is blank" do
      @product.name = nil
      @product.price = 200
      @product.quantity = 2
      @product.category_id = @category.id
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "Should produce a price error if price is blank" do
      @product.price = nil
      @product.quantity = 2
      @product.category_id = @category.id
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "Should produce a quantity error if quantity is blank" do
      @product.quantity = nil
      @product.price = 200
      @product.category_id = @category.id
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    
    it "Should produce a quantity error if quantity is blank" do
      @product.category_id = nil
      @product.price = 200
      @product.quantity = 2
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
