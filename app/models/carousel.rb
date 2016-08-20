class Carousel < ApplicationRecord
  belongs_to :user
  has_many :posters

  validates :title, presence: true
end
