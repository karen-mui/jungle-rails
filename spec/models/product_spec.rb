require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'is valid' do
      @category = Category.new
      @category.name = "Flowers"
      @product = Product.new
      @product.name = "Peony"
      @product.price = 1000
      @product.quantity = 22
      @product.category = @category
      @product.save
      expect(@product).to be_valid   
    end
    
    it 'name is present' do
      @category = Category.new
      @category.name = "Flowers"
      @product = Product.new
      @product.name = nil
      @product.price_cents = 1000
      @product.quantity = 22
      @product.category = @category
      @product.save
      expect(@product.name).to_not be_present
      expect(@product.errors.full_messages).to include("Name can't be blank")
   
      @product.name = "Peony"
      expect(@product.name).to be_present
    end
    
    it 'price is present' do
      @category = Category.new
      @category.name = "Flowers"
      @product = Product.new
      @product.name = "Peony"
      @product.price_cents = nil
      @product.quantity = 22
      @product.category = @category
      @product.save
      expect(@product.price_cents).to_not be_present
      expect(@product.errors.full_messages).to include("Price can't be blank")
   
      @product.price_cents = 2222
      expect(@product.price_cents).to be_present
    end
    
    it 'quantity is present' do
      @category = Category.new
      @category.name = "Flowers"
      @product = Product.new
      @product.name = "Peony"
      @product.price_cents = 1000
      @product.quantity = nil
      @product.category = @category
      @product.save
      expect(@product.quantity).to_not be_present
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
   
      @product.quantity = 10
      expect(@product.quantity).to be_present
      
    end
    
    it 'category is present' do
      @product = Product.new
      @product.name = "Peony"
      @product.price_cents = 1000
      @product.quantity = 22
      @product.category = nil
      @product.save
      expect(@product.category).to_not be_present
      expect(@product.errors.full_messages).to include("Category can't be blank")
      
      @category = Category.new
      @category.name = "Flowers"
      @product.category = @category
      @product.save
      expect(@product.category).to be_present
    end
    
  end
end
