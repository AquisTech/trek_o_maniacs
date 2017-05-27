class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable, :timeoutable

  ROLES = { 0 => 'guest', 1 => 'organizer', 2 => 'member', 3 => 'volunteer' }

  alias_attribute :name, :username

  has_one :profile
  has_many :addresses
  has_many :contacts, as: :resource

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
