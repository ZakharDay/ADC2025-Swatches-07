class Project < ApplicationRecord
  has_many :swatches, dependent: :destroy
  validates :name, presence: true
end
