class Venue < ApplicationRecord
  has_many :routes, inverse_of: :venue
  has_many :contacts, as: :resource, inverse_of: :resource
  has_many :events, inverse_of: :venue

  accepts_nested_attributes_for :routes, allow_destroy: true
  accepts_nested_attributes_for :contacts, allow_destroy: true

  serialize :attractions
  serialize :base_points

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :purpose, presence: true
  validates :grade, presence: true
  validates :region, presence: true
  validates :description, presence: true
  # validates :base_points
  # validates :attractions

end
