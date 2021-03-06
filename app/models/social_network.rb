class SocialNetwork < ApplicationRecord
  belongs_to :user
  validates :url, format: URI::DEFAULT_PARSER.make_regexp(['http', 'https'])
end
