class Swatch < ApplicationRecord
  has_many :fills, dependent: :destroy
  belongs_to :project
  validates :name, presence: true
end
