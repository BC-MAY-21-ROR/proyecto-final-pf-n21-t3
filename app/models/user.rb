class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_one :social_network, dependent: :destroy
  has_many :skill, dependent: :destroy
end
