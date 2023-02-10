class OmniauthCallbacksController < ApplicationController
    def spotify
        spotify_account = SpotifyAccount.where(username: auth.info.nickname).first_or_initialize
        spotify_account.update(
            name: auth.info.name,
            username: auth.info.nickname,
            image: auth.info.image,
            access_token: auth.credentials.token,
            refresh_token: auth.credentials.refresh_token,
            expires_at: auth.credentials.expires_at
        )
        session[:user_id] = spotify_account.id 

        redirect_to home_path
        
        
    end

    def failure
        redirect_to root_path, alert: "Your account is not authorized to access this app via the Spotify API due to Spotify developer restrictions."
    end
    private 
    def auth
        request.env['omniauth.auth']
    end
end