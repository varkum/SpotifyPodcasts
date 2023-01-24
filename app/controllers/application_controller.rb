class ApplicationController < ActionController::Base
    before_action :set_current_user
    
    def require_user_logged_in 
        if Current.user.nil?
            redirect_to root_path
        end
    end

    
    private

    def set_current_user
        if session[:user_id]
            Current.user = SpotifyAccount.find(session[:user_id])
        end
    end

    def refresh_user_saved_episodes
        Current.user.get_saved_episodes
        Current.user.clear_episodes
    end

    

end
