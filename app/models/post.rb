class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader


 def to_param
   "#{permalink}"
 end
  

end
