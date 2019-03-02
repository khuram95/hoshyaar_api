class User < ApplicationRecord
  validates :phone_number, uniqueness: true
  validates :phone_number, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, authentication_keys: :phone_number
end
