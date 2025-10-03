class Fill < ApplicationRecord
  has_many :colors
  belongs_to :user
  belongs_to :swatch
  validates :name, presence: true
end
