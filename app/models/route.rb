class Route < ApplicationRecord
  belongs_to :venue, inverse_of: :routes
  serialize :modes_of_transport

  # setter
  def modes_of_transport=(val)
    super(val.split("\n").map(&:strip))
  end
end
