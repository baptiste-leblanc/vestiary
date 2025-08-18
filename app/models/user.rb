class User < ApplicationRecord
  has_many :contexts, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :mail, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :weight, numericality: { greater_than: 0 }, allow_nil: true
  validates :height, numericality: { greater_than: 0 }, allow_nil: true
  validates :gender, inclusion: { in: %w[male female other], message: "%<value> n'est pas valide" }, allow_nil: true

  # PostgreSQL array (pictures: string[])
  serialize :pictures, Array
end
