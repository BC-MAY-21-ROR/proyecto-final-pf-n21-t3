class Profile < ApplicationRecord
  belongs_to :user
  validates :phone_num, :city, :state, :country, :description, presence: true
end
