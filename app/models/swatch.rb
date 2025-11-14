class Swatch < ApplicationRecord
  has_many :fills, dependent: :destroy
  belongs_to :user
  belongs_to :project, optional: true

  has_many :forks, class_name: "Swatch", foreign_key: "origin_id"
  belongs_to :origin, class_name: "Swatch", optional: true

  validates :name, presence: true

  # def as_json
  #   {
  #     name: name,
  #     fills: fills
  #   }
  # end
end
