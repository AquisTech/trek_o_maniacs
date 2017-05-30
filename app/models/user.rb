class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable, :timeoutable

  ROLES = { 0 => 'guest', 1 => 'organizer', 2 => 'member', 3 => 'volunteer' }

  alias_attribute :name, :username
  attr_accessor :current_password, :validate_current_password

  has_one :profile
  has_many :addresses
  has_many :contacts, as: :resource

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :current_password, presence: true, match_existing_password: true, if: :validate_current_password

  # setter
  def role=(val)
    self[:role] = ROLES.key(val)
  end

  # getter
  def role
    ROLES[self[:role]]
  end

  ROLES.each do |id, name|
    define_method "#{name}?" do
      role == name
    end
  end
end
