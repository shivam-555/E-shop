class OrdersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
    if @order.save
      format.html { redirect_to @order, notice: "Order was successfully placed." }
      format.json { render :show, status: :created, location: @order }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
    end
  end

  def edit
  end

  def update
  end

  private
  def order_params
    params.fetch(:order, {})
  end

end
