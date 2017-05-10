class PurchaseOrdersController < ApplicationController
 
  def index
    @purchase_orders = PurchaseOrder.eager.all
  end

  def show
    @purchase_order = PurchaseOrder.eager.find(params[:id])
    breadcrumbs.add :'purchase_orders.show.title', purchase_order_path(@purchase_order)
  end

  def new
    @purchase_order = PurchaseOrder.new
    breadcrumbs.add :'purchase_orders.new.title', new_purchase_order_path
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    if @purchase_order.save
      redirect_to @purchase_order, notice: t('.messages.success')
    else
      flash.now[:error] = t('.messages.fail')
      render 'new'
    end
  end

  def destroy
    PurchaseOrder.destroy(params[:id])
    redirect_to purchase_orders_path, notice: t('.messages.success')
  end

  private

  def purchase_order_params
    params.fetch(:purchase_order, {}).permit(:incoming_txt_file)
  end
end
