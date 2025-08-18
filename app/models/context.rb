class Context < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :looks
end
