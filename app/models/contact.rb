class Contact < ApplicationRecord
  belongs_to :resource, polymorphic: true, inverse_of: :contacts

  contact_number_attributes :number
end
