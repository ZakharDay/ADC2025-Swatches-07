class Fill < ApplicationRecord
  belongs_to :user

  has_many :swatch_fills
  has_many :swatches, through: :swatch_fills

  has_many :fill_colors
  has_many :colors, through: :fill_colors

  has_many :comments, as: :commentable

  validates :name, presence: true
end
