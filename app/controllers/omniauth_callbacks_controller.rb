class OmniauthCallbacksController < ApplicationController
    def spotify
        spotify_account = SpotifyAccount.where(username: auth.info.nickname).first_or_initialize
        
        spotify_account.update(
            name: auth.info.name,
            username: auth.info.nickname,
            image: auth.info.image,
            access_token: auth.credentials.token,
            refresh_token: auth.credentials.refresh_token
        )
        render plain: "Success!"
        
        
    end

    def auth
        request.env['omniauth.auth']
    end
end