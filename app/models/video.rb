class Video < ActiveRecord::Base
  default_scope :order => 'title DESC'
end

