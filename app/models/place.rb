class Place < ActiveRecord::Base
  acts_as_list
  has_ancestry

end
