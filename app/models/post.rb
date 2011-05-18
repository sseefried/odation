class Post < ActiveRecord::Base

 def to_param
   "#{permalink}"
 end
  

end
