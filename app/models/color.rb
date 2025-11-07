class Color < ApplicationRecord
  belongs_to :user
  belongs_to :fill

  # def as_json
  #   {
  #     color: color,
  #     alpha: alpha,
  #     stop: stop
  #   }
  # end
end
