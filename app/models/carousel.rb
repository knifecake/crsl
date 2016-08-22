class Carousel < ApplicationRecord
  belongs_to :user
  has_many :posters, dependent: :destroy

  validates :title, presence: true

  def portrait?
    user.settings.display_orientation == 'portrait'
  end

  def landscape?
    user.settings.display_orientation == 'landscape'
  end

  def speed
    user.settings.carousel_speed
  end

  def can_be_previewed?
    posters.any?
  end
end
