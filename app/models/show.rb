class Show < ApplicationRecord
  belongs_to :spotify_account
  has_many :episodes
end
