require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :you_tube, ENV['GOOGLE_CONSUMER_KEY'], ENV['GOOGLE_CONSUMER_SECRET']
end
