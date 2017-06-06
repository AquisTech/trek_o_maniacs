class Event < ApplicationRecord
  belongs_to :venue, inverse_of: :events
  serialize :attractions
  serialize :inclusions
  serialize :exclusions
  serialize :contact_details
end
