class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable, :timeoutable

  ROLES = { 0 => 'guest', 1 => 'organizer', 2 => 'member', 3 => 'volunteer' }

  alias_attribute :name, :username

  has_one :profile, inverse_of: :user
  has_many :addresses, inverse_of: :user
  has_many :contacts, as: :resource, inverse_of: :resource

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  # setter
  def role=(val)
    super(ROLES.key(val))
  end

  # getter
  def role
    ROLES[super]
  end

  ROLES.each do |id, name|
    define_method "#{name}?" do
      role == name
    end
  end
end
