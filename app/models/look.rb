class Look < ApplicationRecord
  belongs_to :context
  has_many :look_piece, dependent: :destroy
  has_many :pieces, through: :look_piece
end
