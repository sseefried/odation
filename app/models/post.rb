class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :taggings
  has_many :tags, :through => :taggings
  attr_reader :tag_tokens, :to_param

 def to_param
   "#{permalink}"
 end

  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end

end
