class Video < ActiveRecord::Base
  scope :drop_time, :order      => 'drop_time  DESC'
  scope :recent,    :order      => 'published_at DESC'
  scope :enabled,   :conditions => 'disabled = false'
  scope :disabled,  :conditions => 'disabled = true'

  after_save :reverse_geocode

  def self.rank
    Video.enabled.drop_time.each_with_index do |video, i|
      video.update_attributes :rank => i+1
    end
  end

  private

  def reverse_geocode
    if (latitude and longitude) and (!city or !state or !country)
      r = Geokit::Geocoders::GoogleGeocoder.reverse_geocode "#{latitude},#{longitude}"
      self.update_attributes :city => r.district || r.city, :state => r.state, :country => r.country
    end
  end
end

