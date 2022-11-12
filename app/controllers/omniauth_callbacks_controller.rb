class OmniauthCallbacksController < ApplicationController
    def spotify
        render plain: "success!"
    end
end