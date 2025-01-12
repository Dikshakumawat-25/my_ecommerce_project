class ProductsController < ApplicationController
    before_action :set_category
    before_action :set_product, only: [:show, :edit, :update, :destroy]
  
    def index
      @products = @category.products
    end
  
    def show; end
  
    def new
      @product = @category.products.build
    end
  
    def create
      @product = @category.products.build(product_params)
      if @product.save
        redirect_to category_products_path(@category), notice: 'Product created successfully.'
      else
        render :new
      end
    end
  
    def edit; end
  
    def update
      if @product.update(product_params)
        redirect_to category_products_path(@category), notice: 'Product updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      @product.destroy
      redirect_to category_products_path(@category), notice: 'Product deleted successfully.'
    end
  
    private
  
    def set_category
      @category = Category.find(params[:category_id])
    end
  
    def set_product
      @product = @category.products.find(params[:id])
    end
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :discount_price, :stock_quantity, :vendor_id)
    end
  end
  