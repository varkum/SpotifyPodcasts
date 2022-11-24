class HomeController < ApplicationController
    before_action :require_user_logged_in

    def index
        client = SpotifyApi::Client.new
        Rails.logger.info(client.hello)
    end
end