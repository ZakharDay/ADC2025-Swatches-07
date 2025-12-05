class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :projects
  has_many :swatches
  has_many :fills
  has_many :colors
  has_many :comments

  after_create :create_profile
end
