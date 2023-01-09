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

    def get_saved_episodes
        

        self.client.fetch_saved_episodes["items"].each do |episode|
      
            local_episode = self.episodes.where(name: episode["episode"]["name"]).first_or_initialize
            status = "new"
            time_left = episode["episode"]["duration_ms"] - episode["episode"]["resume_point"]["resume_position_ms"]
            Rails.logger.info(local_episode.spotify_account_id)
            if (time_left > 30000)
                status = "in_progress"
            else  
                status = "done"
            end

            local_episode.update(
                
                name: episode["episode"]["name"],
                progress: time_left,
                spotify_id: episode["episode"]["id"],
                status: status,
                starred: false,
                image: episode["episode"]["images"][0]["url"],
                show: episode["episode"]["show"]["name"]
            )

        end 
    end


    
end
