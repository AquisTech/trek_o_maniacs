class Route < ApplicationRecord
  belongs_to :venue
  serialize :modes_of_transport
end
