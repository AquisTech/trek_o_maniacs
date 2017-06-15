class Route < ApplicationRecord

  # serialize attributes
  serialize :modes_of_transport
  # validations
  validates :name, presence: true
  validates :start_point, presence: true
  validates :via, presence: true
  validates :end_point, presence: true
  validates :description, presence: true
  validates :distance, presence: true, numericality: { greater_than: 0, less_than: 5000 }
  validates :modes_of_transport, presence: true

  # Associations
  # belongs_to
  belongs_to :venue, inverse_of: :routes

end
