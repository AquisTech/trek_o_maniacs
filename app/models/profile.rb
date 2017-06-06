class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile
  serialize :social_links
end
