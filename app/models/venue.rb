class Venue < ApplicationRecord
  has_many :routes
  has_many :contacts, as: :resource
  serialize :attractions
end
