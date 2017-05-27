class Contact < ApplicationRecord
  belongs_to :resource, polymorphic: true

  contact_number_attributes :number
end
