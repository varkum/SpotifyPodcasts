class ApplicationController < ActionController::Base
    before_action :set_current_user
    
    private

    def set_current_user
        if session[:user_id]
            Current.user = SpotifyAccount.find(session[:user_id])
        end
    end
end
