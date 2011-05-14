class SubscribersController < ApplicationController
  def index
    @subscriber = Subscriber.all
    
  end

end
