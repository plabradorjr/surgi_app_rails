OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['USjlBGcJMF2xFNLTu4gZP0Pnp'], ENV['Bzcc8iSMY7UqPAHiGK6L6BGlg2WxPbxbbENy4qGCyXAdOsERHL']
end