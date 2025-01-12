class CartItemsController < ApplicationController
    before_action :set_cart_item, only: [:update, :destroy]
  
    def index
      @cart_items = current_user.cart.cart_items
    end
  
    def create
      @cart_item = current_user.cart.cart_items.build(cart_item_params)
      if @cart_item.save
        redirect_to cart_items_path, notice: 'Item added to cart successfully.'
      else
        render :index
      end
    end
  
    def update
      if @cart_item.update(cart_item_params)
        redirect_to cart_items_path, notice: 'Cart updated successfully.'
      else
        render :index
      end
    end
  
    def destroy
      @cart_item.destroy
      redirect_to cart_items_path, notice: 'Item removed from cart successfully.'
    end
  
    private
  
    def set_cart_item
      @cart_item = current_user.cart.cart_items.find(params[:id])
    end
  
    def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
    end
  end
  