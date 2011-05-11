class PlacesController < ApplicationController
  respond_to :html, :xml, :json
  

  
  
  def index
    @places = Place.all
    
    respond_with @places
  end
                 
  def show
    @place = Place.find(params[:id])
    
    respond_with @place 
  end
  
  def edit
     @place = Place.find(params[:id])

      respond_with @place  
  end                        
  
  # PUT /temps/1   Place
   # PUT /temps/1.xml
   def update
     @place = Place.find(params[:id])

     respond_to do |format|
       if @place.update_attributes(params[:place])
         format.html { redirect_to(@place, :notice => 'Place was successfully updated.') }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
       end
     end
   end

   # DELETE /Places/1
   # DELETE /Places/1.xml
   def destroy
     @place = Place.find(params[:id])
     @place.destroy

     respond_to do |format|
       format.html { redirect_to(places_url) }
       format.xml  { head :ok }
     end
   end
  
  def new
    @place = Place.new
    @places = Place.all 
    respond_with @place 
  end
  
  def create
    @place = Place.new(params[:place])
    
    respond_to do |wants|
      if @place.save
        flash[:notice] = 'Place was successfully created.'
        wants.html { redirect_to(@place) }
        wants.xml { render :xml => @place, :status => :created, :location => @place }
      else
        wants.html { render :action => "new" }
        wants.xml { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end
  

end
