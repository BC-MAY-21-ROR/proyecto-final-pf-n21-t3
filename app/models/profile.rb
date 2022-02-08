class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :phone_num, :city, :state, :country, :description, presence: true
end
