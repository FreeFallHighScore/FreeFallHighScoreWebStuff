class Video < ActiveRecord::Base
  default_scope :order => 'drop_time DESC'
end

