class ApplicationController < ActionController::Base
  ## Commented out for Facebook 
  ## protect_from_forgery


  helper :all
  
  before_filter { |c| Authorization.current_user = c.current_user }
  
  protected
  
  def permission_denied
    flash[:error] = "Sorry youre not allowed here"
    redirect_to root_url
  end
  


  
end
