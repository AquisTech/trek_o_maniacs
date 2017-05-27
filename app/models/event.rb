class Event < ApplicationRecord
  belongs_to :venue
  serialize :attractions
  serialize :inclusions
  serialize :exclusions
  serialize :contact_details
end
