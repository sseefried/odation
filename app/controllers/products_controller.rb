class ProductsController < ApplicationController

respond_to :html, :xml, :json

def index
  @products = Product.all
  
  respond_with @products

end              


def show
  @product = Product.find(params[:id])
  
  respond_with @product

end
   
def create
  @product = Product.new(params[:product])
  
  respond_to do |wants|
    if @product.save
      flash[:notice] = 'Product was successfully created.'
      wants.html { redirect_to(@product) }
      wants.xml { render :xml => @product, :status => :created, :location => @product }
    else
      wants.html { render :action => "new" }
      wants.xml { render :xml => @product.errors, :status => :unprocessable_entity }
    end
  end
end
         
def new
    @product = Product.new(params[:product])     

    respond_with @products

  end
  
       

end
