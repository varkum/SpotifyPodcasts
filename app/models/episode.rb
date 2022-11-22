class Episode < ApplicationRecord
  belongs_to :spotify_acccount
  belongs_to :show
end
