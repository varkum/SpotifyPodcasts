class SessionsController < ApplicationController
    def index
        redirect_to home_path if Current.user.present?
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end