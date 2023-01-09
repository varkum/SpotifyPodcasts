class HomeController < ApplicationController
    before_action :require_user_logged_in

    def index
        Current.user.get_saved_episodes
        @episodes = Current.user.episodes
    end
end