class Favorite < ApplicationRecord
  belongs_to :user
  validates_presence_of :location, :user_id
  validates_uniqueness_of :location, scope: :user
end
