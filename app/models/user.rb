class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carousels, dependent: :destroy

  validates :name, presence: true

  # protected
  # def confirmation_required?
  #   false
  # end
end
