class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with :name => "Jungle", :password => "book" 

  def index
    @categories = Category.order(id: :desc).all
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)

    if @category.save
      redirect_to admin_categories_path, notice: "Category created!"
    else
      render :new
    end
  end
  
  # protect form submission against malicious users
  def product_params
    params.require(:category).permit(
      :name
    )
  end

end
