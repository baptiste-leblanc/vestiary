class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :contexts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :height, presence: true, numericality: { greater_than: 0, less_than: 300 }
  validates :weight, presence: true, numericality: { greater_than: 0, less_than: 500 }
  validates :gender, presence: true, inclusion: { in: %w[male female other] }
end
