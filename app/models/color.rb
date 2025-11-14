class Color < ApplicationRecord
  has_many :fill_colors
  has_many :fills, through: :fill_colors
end
