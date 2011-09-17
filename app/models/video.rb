class Video < ActiveRecord::Base
  default_scope :order => 'drop_time DESC'
  after_save :reverse_geocode

  private

  def reverse_geocode
    if (latitude and longitude) and (!city or !state or !country)
      r = Geokit::Geocoders::GoogleGeocoder.reverse_geocode "#{latitude},#{longitude}"
      self.update_attributes :city => r.district || r.city, :state => r.state, :country => r.country
    end
  end
end

