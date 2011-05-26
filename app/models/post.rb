class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :taggings
  has_many :tags, :through => :taggings
  
  attr_reader :tag_tokens
  
  before_save :create_clean_url   
  
  validates :title, :presence => true, :uniqueness => true
  validates :body, :presence => true

 def to_param
   "#{permalink}"
 end

  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end


  private

  def create_clean_url
    if self.permalink.blank?
      # Remove non-alpha characters. Replace spaces with hyphens.
      self.permalink = self.title.downcase.gsub(/[^(a-z0-9)^\s]/, '').gsub(/\s/, '-')
    end
  end
end
