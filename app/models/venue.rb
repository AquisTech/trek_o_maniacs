class Venue < ApplicationRecord
  has_many :routes
  has_many :contacts, as: :resource

  accepts_nested_attributes_for :routes, allow_destroy: true
  accepts_nested_attributes_for :contacts, allow_destroy: true

  serialize :attractions

  # setter
  def attractions=(val)
    super(val.split("\n").map(&:strip))
  end
end
