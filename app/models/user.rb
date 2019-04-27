class User < ApplicationRecord
  validates :phone_number, uniqueness: true
  validates :phone_number, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
        #  authentication_keys: :phone_number
  include DeviseTokenAuth::Concerns::User

  has_one :otpcode, dependent: :destroy
  has_many :subscribes
  has_many :schools, through: :subscribes
  has_many :reports
  has_many :comments#, through: :reports
  has_many :verified_school_datas
  has_many :report_reactions, through: :reports
  def add_user_uid
    self.uid = SecureRandom.uuid
  end
end
