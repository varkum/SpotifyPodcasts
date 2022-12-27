class SpotifyAccount < ApplicationRecord
    validates :username, uniqueness: true

    has_many :episodes
    has_many :shows
    
    def client
        SpotifyApi::Client.new(options = {
            access_token: access_token,
            refresh_token: refresh_token,
            expires_at: expires_at
        })
    end
end
