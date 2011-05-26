class PostsController < ApplicationController
  #require koala

 before_filter :koala_graph

def koala_graph
  
  oauth = Koala::Facebook::OAuth.new("927472d970b098cc3a14fc14bfbef606", "41f3a21f84e3ba4a085044fc947fe508", "http://odation.dev")
  token = oauth.get_app_access_token
  @graph = Koala::Facebook::GraphAPI.new(token) 
end
                                     

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find_by_permalink(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    
    
  end

  # GET /posts/1/edit
   
  def edit
    @post = Post.find_by_permalink(params[:id])

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @post }
      end
  end

  # POST /posts
  # POST /posts.xml
  def create

    @post = current_user.posts.new(params[:post])

     
    respond_to do |format|
      if @post.save
 
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find_by_permalink(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find_by_permalink(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
