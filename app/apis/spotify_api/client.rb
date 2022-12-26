require "httparty"

module SpotifyApi
      class Client
        include HTTParty
        #base_uri "api.spotify.com/v1"

        def initialize(options = {})
          @access_token = options[:access_token]
          @refresh_token = options[:refresh_token]
          @expires_at = options[:expires_at]
        end

        def test
          self.class.get("/shows/38bS44xjbVVZ3No3ByF1dJ", {headers: {Authorization: "Bearer BQCrFTLAWxiBhncpHVg52Wwd49NHbVfFFXH0EVpJVoEdqlxbmrMXKrIYTHhwSv0JrFyvHyG5euX_8Mw2886WOCiryuuVnf5UDyVGpELtGJK32jB7KZhrCCOW4MwKECYQ2GQvNiXRPwOUal9CGZBwPYE_7Tl2YMUaDt8a79GdBQvAMIhf2fipcweaKpGqo25KPtbRxIS-ghn0UItzUTf9x1n-8OEE6bYYZw"}})
        end

        def refresh 
          self.class.post("https://accounts.spotify.com/api/token", {headers: {Authorization: "Basic " +  Base64.strict_encode64("#{Rails.application.credentials.dig(:spotify, :client_id)}:#{Rails.application.credentials.dig(:spotify, :client_secret)}")}, Content_type: "application/x-www-form-urlencoded", body: {grant_type: "refresh_token", refresh_token: "AQCLRCWKIoZJfM_hB7Y3O4OznCIQ9AkP6wNuWxOuCNr4LQvy0i0K-xYQbUQG5FW5o4rWFPYzfFhcI7H4uRQOi-3cricrIqST-VIrKuDDi1lQOZV29jKOcJhIqtuWOpDw_hI"}})
        end
        
      end
       
      


  
end
