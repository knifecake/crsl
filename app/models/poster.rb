class Poster < ApplicationRecord
  belongs_to :carousel

  has_attached_file :background,
    styles: {
      preview: { resize: '600x420' },
      carousel: { resize: '1542x1080' },
      rotated: { resize: '1542x1080', rotation: '-90' }
    },
    processors: [:posterify, :rotator]

  validates :title, presence: true
  validates_attachment :background,
    presence: true,
    content_type: { content_type: /\Aimage\/.*\z/ }

  def height(style)
      carousel.user.settings.display_orientation == 'portrait' ? '300px' : '210px'
  end

  def width(style)
    carousel.user.settings.display_orientation == 'portrait' ? '210px' : '300px'
  end
end
