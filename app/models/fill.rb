class Fill < ApplicationRecord
  belongs_to :swatch
  validates :name, presence: true
end
