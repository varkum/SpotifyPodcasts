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
            status = "in_progress"
            time_left = episode["episode"]["duration_ms"].to_i - episode["episode"]["resume_point"]["resume_position_ms"].to_i
            
            local_episode.update(
                name: episode["episode"]["name"],
                progress: time_left,
                duration: episode["episode"]["duration_ms"].to_i,
                spotify_id: episode["episode"]["id"],
                image: episode["episode"]["images"][0]["url"],
                show: episode["episode"]["show"]["name"]
            )

            if local_episode.youtube_progress.blank?
                if (episode["episode"]["resume_point"]["fully_played"] or time_left < 300000)
                    status = "done"
                elsif (episode["episode"]["resume_point"]["resume_position_ms"] == 0)
                    status = "new"
                end
            else  
                Rails.logger.info("youtube status update! #{local_episode.name}")
                if (local_episode.youtube_progress < 300000)
                    status = "done"
                end
            end
            local_episode.update(status: status)
        end 
    end 

    def clear_episodes
        self.episodes.each do |episode|
            if episode.last_played && episode.status == "in_progress" && DateTime.now.to_i - episode.last_played.to_i > 14.days
                self.client.unsave_episode(episode.spotify_id)
                self.episodes.find(episode.id).destroy

            end
        end
    end


    
end
