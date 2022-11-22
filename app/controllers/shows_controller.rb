class ShowsController < ApplicationController
    before_action :set_show, only: [:show, :update, :destroy]
    before_action :require_user_logged_in
    
    #GET /shows
    def index

    end

    #GET /shows/new
    def new

    end

    #POST /shows
    def create

    end

    #GET /shows/:id
    def show

    end

    #PATCH /shows/:id
    def update

    end

    #DELETE /shows/:id
    def destroy

    end

    private

    def set_show
        @show = Show.find(params[:id])
    end
end