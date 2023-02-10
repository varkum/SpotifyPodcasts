Rails.application.config.middleware.use OmniAuth::Builder do
    provider :spotify, Rails.application.credentials.dig(:spotify, :client_id), Rails.application.credentials.dig(:spotify, :client_secret), scope: "user-read-playback-position user-library-modify streaming  user-read-private user-library-read"

    
    
end

Rails.application.config.to_prepare do
    OmniAuth.config.on_failure = OmniauthCallbacksController.action(:failure)
end


