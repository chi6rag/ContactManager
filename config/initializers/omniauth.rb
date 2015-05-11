Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Figaro.env.twitter_app_id, Figaro.env.twitter_app_secret
end