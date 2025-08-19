class Piece < ApplicationRecord
  has_many :look_piece, dependent: :destroy
  has_many :looks, through: :look_piece
end
