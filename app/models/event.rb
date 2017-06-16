class Event < ApplicationRecord
  belongs_to :venue, inverse_of: :events
  serialize :event_leaders
  serialize :attractions
  serialize :inclusions
  serialize :exclusions
  serialize :things_to_carry
  serialize :disclaimer
  serialize :contact_details

  # validations for start date less than end date
end
