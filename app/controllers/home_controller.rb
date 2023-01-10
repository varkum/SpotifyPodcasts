class HomeController < ApplicationController
    before_action :require_user_logged_in

    def index
        Current.user.get_saved_episodes
        @episodes = Current.user.episodes.where(nil)
        @in_progress = @episodes.filter_by_status("in_progress")
        @up_next = @episodes.filter_by_status("new")
    end
end