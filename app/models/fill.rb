class Fill < ApplicationRecord
  belongs_to :user

  has_many :swatch_fills
  has_many :swatches, through: :swatch_fills

  has_many :fill_colors
  has_many :colors, through: :fill_colors

  validates :name, presence: true
end
