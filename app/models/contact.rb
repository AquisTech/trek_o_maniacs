class Contact < ApplicationRecord
  belongs_to :user

  contact_number_attributes :number
end
