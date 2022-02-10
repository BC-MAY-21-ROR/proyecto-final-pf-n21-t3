class SocialNetwork < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
