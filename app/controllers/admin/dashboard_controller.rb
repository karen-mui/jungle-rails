class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with :name => "Jungle", :password => "book" 

  def show
    @product_quantity = Product.count
    @category_amount = Category.count
  end

end
