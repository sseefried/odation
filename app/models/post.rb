class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :taggings
  has_many :tags, :through => :taggings
  attr_reader :tag_tokens
  
  validates :title, :presence => true, :uniqueness => true
  validates :body, :presence => true

 def to_param
   "#{permalink}"
 end

  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end

end
