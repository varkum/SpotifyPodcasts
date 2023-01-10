class Episode < ApplicationRecord
  belongs_to :spotify_account
  scope :filter_by_status, -> (status) { where status: status}
  
end
