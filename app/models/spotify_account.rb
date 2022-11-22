class SpotifyAccount < ApplicationRecord
    validates :username, uniqueness: true
end
