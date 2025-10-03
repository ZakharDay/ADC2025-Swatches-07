class Project < ApplicationRecord
  has_many :swatches, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
end
