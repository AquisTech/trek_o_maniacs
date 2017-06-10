class Route < ApplicationRecord
  belongs_to :venue, inverse_of: :routes
  serialize :modes_of_transport
end
