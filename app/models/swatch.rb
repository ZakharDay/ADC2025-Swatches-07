class Swatch < ApplicationRecord
  has_many :fills, dependent: :destroy
  belongs_to :user
  belongs_to :project, optional: true
  validates :name, presence: true
end
