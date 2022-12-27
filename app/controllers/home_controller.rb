class HomeController < ApplicationController
    before_action :require_user_logged_in

    def index
        @episodes = Current.user.client.get_saved_episodes["items"]
        #Rails.logger.info(@episodes[0])
    end
end