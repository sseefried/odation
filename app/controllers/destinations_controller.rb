class DestinationsController < ApplicationController
  respond_to :html, :xml, :json
  

  
  
  def index
    @destinations = Destination.all
    
    respond_with @destinations
  end
                 
  def show
    @destination = Destination.find(params[:id])
    
    respond_with @destination 
  end
  
  def edit
     @destination = Destination.find(params[:id])

      respond_with @destination  
  end                        
  
  # PUT /temps/1   Destination
   # PUT /temps/1.xml
   def update
     @destination = Destination.find(params[:id])

     respond_to do |format|
       if @destination.update_attributes(params[:destination])
         format.html { redirect_to(@destination, :notice => 'Destination was successfully updated.') }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @destination.errors, :status => :unprocessable_entity }
       end
     end
   end

   # DELETE /Destinations/1
   # DELETE /Destinations/1.xml
   def destroy
     @destination = Destination.find(params[:id])
     @destination.destroy

     respond_to do |format|
       format.html { redirect_to(destinations_url) }
       format.xml  { head :ok }
     end
   end
  
  def new
    @destination = Destination.new
    @destinations = Destination.all 
    respond_with @destination 
  end
  
  def create
    @destination = Destination.new(params[:destination])
    
    respond_to do |wants|
      if @destination.save
        flash[:notice] = 'Destination was successfully created.'
        wants.html { redirect_to(@destination) }
        wants.xml { render :xml => @destination, :status => :created, :location => @destination }
      else
        wants.html { render :action => "new" }
        wants.xml { render :xml => @destination.errors, :status => :unprocessable_entity }
      end
    end
  end
  

end
