class Video < ActiveRecord::Base
  scope :by_drop_time, with_exclusive_scope { order("title DESC") }
end
