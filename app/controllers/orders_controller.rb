class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]
  
    def index
      @orders = current_user.orders
    end
  
    def show; end
  
    def new
      @order = current_user.orders.build
    end
  
    def create
      @order = current_user.orders.build(order_params)
      if @order.save
        redirect_to @order, notice: 'Order placed successfully.'
      else
        render :new
      end
    end
  
    def destroy
      @order.destroy
      redirect_to orders_url, notice: 'Order canceled successfully.'
    end
  
    private
  
    def set_order
      @order = current_user.orders.find(params[:id])
    end
  
    def order_params
      params.require(:order).permit(:order_status, :total_price, :payment_status, :shipping_address_id, :billing_address_id)
    end
  end
  