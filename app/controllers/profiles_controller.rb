class ProfilesController < ApplicationController
  #require koala

before_filter :koala_graph

def koala_graph
  oauth = Koala::Facebook::OAuth.new("927472d970b098cc3a14fc14bfbef606", "41f3a21f84e3ba4a085044fc947fe508", "http://odation.dev")
  token = oauth.get_app_access_token
  @graph = Koala::Facebook::GraphAPI.new(token) 
end
                                     

  # GET /profiles
  # GET /profiles.xml
  def index
    @profiles = Profile.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.xml
  def new
    @profile = Profile.new
    
    
  end

  # GET /profiles/1/edit
   
  def edit
    @profile = Profile.find(params[:id])

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @profile }
      end
  end

  # POST /profiles
  # POST /profiles.xml
  def create

    @profile = current_user.profiles.new(params[:profile])

     
    respond_to do |format|
      if @profile.save
 
        format.html { redirect_to(@profile, :notice => 'Profile was successfully created.') }
        format.xml  { render :xml => @profile, :status => :created, :location => @profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(@profile, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.xml
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(profiles_url) }
      format.xml  { head :ok }
    end
  end
end
