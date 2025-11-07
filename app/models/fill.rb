class Fill < ApplicationRecord
  has_many :colors, dependent: :destroy
  belongs_to :user
  belongs_to :swatch
  validates :name, presence: true

  # def as_json
  #   {
  #     name: name,
  #     colors: colors
  #   }
  # end
end
