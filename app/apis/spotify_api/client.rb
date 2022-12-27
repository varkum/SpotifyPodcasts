require "httparty"

module SpotifyApi
      class Client
        include HTTParty
        base_uri "api.spotify.com/v1"
        
        attr_accessor :access_token, :expires_at

        

        def initialize(options = {})
          @access_token = options[:access_token]
          @refresh_token = options[:refresh_token]
          @expires_at = options[:expires_at]
        end

        def get_saved_episodes
          self.refresh
          self.class.get("/me/episodes", {headers: {Authorization: "Bearer #{@access_token}"}})
        end 

        def refresh 
          if ( @expires_at - Time.now.to_i <=0 )
            @access_token = self.class.post("https://accounts.spotify.com/api/token", {headers: {Authorization: "Basic " +  Base64.strict_encode64("#{Rails.application.credentials.dig(:spotify, :client_id)}:#{Rails.application.credentials.dig(:spotify, :client_secret)}")}, Content_type: "application/x-www-form-urlencoded", body: {grant_type: "refresh_token", refresh_token: @refresh_token.to_s}})["access_token"]
            @expires_at = @expires_at + 3600
         
          end 

          
        end
        
        
      end
       
      


  
end
