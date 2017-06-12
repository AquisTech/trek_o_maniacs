class Contact < ApplicationRecord

  # Gem/Plugins options
  contact_number_attributes :number

  # CONSTANTS
  PURPOSES = [
    'Food',
    'Transport',
    'Stay (Rooms)',
    'Stay (Tents)',
    'Guide',
    'Trekking Materials'
  ]

  # Attribute accessors
  # Attribute accessors for number_attributes are Defined in gem has_contact_number

  # validations
  # validations for number_attributes are defined in gem has_contact_number
  validates :purpose, presence: true, inclusion: { in: PURPOSES }
  validates :name, presence: true

  # Associations
  # belongs_to
  belongs_to :resource, polymorphic: true, inverse_of: :contacts

  # Getter setter to be decided
  # Getter/setter methods for number_attributes are Defined in gem has_contact_number

end
