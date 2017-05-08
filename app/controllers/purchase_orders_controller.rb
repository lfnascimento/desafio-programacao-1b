class PurchaseOrdersController < ApplicationController
 
  def index
    @purchase_orders = PurchaseOrder.includes(:purchases).all
  end

  def show
    @purchase_order = PurchaseOrder.includes(:purchases).find(params[:id])
  end

  def new
    @purchase_order = PurchaseOrder.new
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    if @purchase_order.save
      redirect_to @purchase_order, notice: "I18n.t('')"
    else
      flash[:error] = "I18n.t('')"
      render 'new'
    end
  end

  private

  def purchase_order_params
    params.require(:purchase_order).permit(:incoming_txt_file) if params[:purchase_order]
  end
end
