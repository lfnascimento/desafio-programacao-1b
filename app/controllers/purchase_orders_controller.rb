class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:new, :create]
  
  def index
    @purchase_orders = PurchaseOrder.eager.all
  end

  def show
    @purchase_order = PurchaseOrder.eager.find(params[:id])
    breadcrumbs.add :'purchase_orders.show.title', purchase_order_path(@purchase_order)
  end

  def new
    breadcrumbs.add :'purchase_orders.new.title', new_purchase_order_path
  end

  def create
    incoming_file = purchase_order_params[:uploaded_txt_file]
    @purchase_order.uploaded_txt_file = incoming_file if content_type_plain_text?(incoming_file)
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

  def set_purchase_order
    @purchase_order = PurchaseOrder.new
  end

  def purchase_order_params
    params.fetch(:purchase_order, {}).permit(:uploaded_txt_file)
  end

  def content_type_plain_text?(incoming_file)
    return unless incoming_file
    incoming_file.content_type == 'text/plain'
  end
end
