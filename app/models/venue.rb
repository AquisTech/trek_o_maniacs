class Venue < ApplicationRecord
  has_many :routes
  has_many :contacts, as: :resource
  serialize :attractions

  # setter
  def attractions=(val)
    super(val.split("\n").map(&:strip))
  end
end
