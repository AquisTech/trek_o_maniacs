class Profile < ApplicationRecord
  belongs_to :user
  serialize :social_links
end
