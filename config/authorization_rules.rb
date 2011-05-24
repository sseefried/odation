authorization do
  role :admin do
     has_permission_on [:posts, :deals, :destinations, :tags], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
   end

   role :guest do
     has_permission_on :posts, :to => [:index, :show]
   end
   
   role :moderator do
     includes :guest
     has_permission_on :tags, :to => [:index, :create]
   end

end
