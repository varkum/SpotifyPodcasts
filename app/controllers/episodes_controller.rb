class EpisodesController < ApplicationController
    before_action :set_episode, only: [:show, :update, :destroy]
    before_action :require_user_logged_in

    #GET /episodes
    def index
        @episodes = Current.user.episodes.all
    end

    def history
        @episodes = Current.user.episodes.where(status: "done")
    end

    def favorites
        @episodes = Current.user.episodes.where(starred: true)
    end
    
    #GET /episodes/new
    def new

    end

    #POST /episodes
    def create

    end

    #GET /episodes/:id
    def show

    end

    #PATCH /episodes/:id
    def update

    end

    #DELETE /episodes/:id
    def destroy

    end

    private

    def set_episode
        @episode = Episode.find(params[:id])
    end
end