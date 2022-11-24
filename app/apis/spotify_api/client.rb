require "httparty"

module SpotifyApi
      class Client
        include HTTParty
        base_uri "api.spotify.com/v1"

        def initialize(options = {})
          @access_token = options[:access_token]
          @refresh_token = options[:refresh_token]
          @expires_at = options[:expires_at]
        end

        def hello
            "hello from Spotify API!"
        end
        
      end
       
      


  
end
