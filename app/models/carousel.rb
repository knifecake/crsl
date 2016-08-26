class Carousel < ApplicationRecord
  belongs_to :user
  has_many :posters, dependent: :destroy

  attribute :display_orientation, :integer, default: 0
  attribute :speed, :integer, default: 10_000 # 10 seconds

  validates :display_orientation, presence: true
  validates :speed, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true

  def can_be_previewed?
    posters.any?
  end
end
