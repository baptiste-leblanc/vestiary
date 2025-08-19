class Context < ApplicationRecord
  has_many :looks, dependent: :destroy
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :looks, dependent: :destroy
end
