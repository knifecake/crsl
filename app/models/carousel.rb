class Carousel < ApplicationRecord
  belongs_to :user
  has_many :posters, dependent: :destroy

  validates :title, presence: true
end
