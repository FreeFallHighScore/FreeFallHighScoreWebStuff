Rails.application.config.middleware.use OmniAuth::Builder do
  provider :youtube, ENV['GOOGLE_CONSUMER_KEY'], ENV['GOOGLE_CONSUMER_SECRET'],
    { :access_type => 'online', :approval_prompt => '' }
end
