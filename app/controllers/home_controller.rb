class HomeController < ApplicationController
    before_action :require_user_logged_in
    before_action :refresh_user_saved_episodes, only: :index

    def index
        @episodes = Current.user.episodes.where(nil)
        @in_progress = @episodes.filter_by_status("in_progress")
        @up_next = @episodes.filter_by_status("new")
    end
end