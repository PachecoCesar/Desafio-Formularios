class SalesController < ApplicationController
  def new
  end

  def create
    sale =  Sale.create(sales_params)
    sale.total = sale.value.to_f * (1-(sale.discount.to_f/100))
    if sale.tax == 0
      sale.total = sale.total * 1.19
      sale.tax = 19
    else
    sale.tax = 0
    end
    sale.save
    redirect_to done_path
  end

  def done
    @sale = Sale.last
  end

private

def set_sales
  @sale = Sale.find(params[:cod])
end

def sales_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total )
  end
end
