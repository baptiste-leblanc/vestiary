class Look < ApplicationRecord
  belongs_to :context
  has_many :pieces, dependent: :destroy
end
