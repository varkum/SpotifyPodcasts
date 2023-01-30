class EpisodesController < ApplicationController
    before_action :set_episode, only: [:show, :update, :edit, :destroy]
    before_action :require_user_logged_in
    before_action :refresh_user_saved_episodes, only: [:index, :history, :favorites]

    #GET /episodes
    def index
        @episodes = Current.user.episodes.all
        session['filters'] = {}
    end

    def history
        @episodes = Current.user.episodes.where(status: "done")
        session['filters'] = {'status': 'done'}
    end

    def favorites
        @episodes = Current.user.episodes.where(starred: true)
        session['filters'] = {'show_starred': 1 }
    end


    #GET /episodes/filter
    def filter
        session['filters'] = {} if session['filters'].blank?
        session['filters'].merge!(filter_params)

        @episodes = Current.user.episodes.all 

        @episodes = @episodes.where("name like ?", "%#{session['filters']['search']}%").or(@episodes.where("show like ?", "%#{session['filters']['search']}%")) if session['filters']['search']
        @episodes = @episodes.where(status: session['filters']['status']) if session['filters']['status'].present?
        @episodes = @episodes.where(starred: session['filters']['show_starred']) if session['filters']['show_starred'].present?

        render partial: 'episode_list', locals: {episodes: @episodes}
    
    end

    #GET /episodes/new
    def new

    end

    def edit 
    end

    #POST /episodes
    def create

    end

    #GET /episodes/:id
    def show

    end

    #PATCH /episodes/:id
    def update
        respond_to do |format|
            if @episode.update(episode_params)
                format.turbo_stream 
                format.html { 
                    
                    if params.permit(:play_source)["play_source"] == 'yt'
                        redirect_to episode_path(@episode.id)
                    else 
                        redirect_to "https://open.spotify.com/episode/#{@episode.spotify_id}?si", allow_other_host: true
                    end

                     }
                

                
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @book.errors, status: :unprocessable_entity }
            end
        end
        
    end


    #DELETE /episodes/:id
    def destroy

    end

    private

    def set_episode
        @episode = Current.user.episodes.find(params[:id])
    end

    def episode_params
        params.require(:episode).permit(:starred, :last_played, :youtube_id, :status, :youtube_progress)
    end

    def filter_params
        params.permit(:search, :status, :show_starred)
    end

    
end