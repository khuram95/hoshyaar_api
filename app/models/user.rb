class User < ApplicationRecord
  validates :phone_number, uniqueness: true
  validates :phone_number, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
        #  authentication_keys: :phone_number
  include DeviseTokenAuth::Concerns::User

  has_one :optcode, dependent: :destroy

  def add_user_uid
    self.uid = SecureRandom.uuid
  end
end
