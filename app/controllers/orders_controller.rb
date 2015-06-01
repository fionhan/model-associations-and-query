class OrdersController < ApplicationController
#layout "application" #to point a fixed layout page
  #layout Proc.new { |controller| controller.request.xhr? ? 'application' : 'orders' }
  layout "orders",except: [:index]
  def index
    @orders=Order.all
  end
  def show
    @order=Order.find(params[:id])
    render layout: "application"
  end
  def update
    #take care !these two lines of codes below is not the same.
    #if you want to go to index page, render :index is not enough!because it need you to add the instance variables @orders!
    #render is
    #when you call redirect_to orders_path,you will execute action index

    #redirect_to orders_path
    #render :index
    #render plain: "OK"

    # render json: params[:order]
    # @orders=Order.all
    # render :index
    redirect_to orders_path
  end

  private
  def param_current
    params.require(:order).permit(:id,:order_no)
  end
end
