class Poster < ApplicationRecord
  belongs_to :carousel

  has_attached_file :background,
    styles: {
      preview: { resize: '600x600' },
      rotated0: { resize: '1920x1920' },
      rotated1: { resize: '1920x1920', rotate: '90' },
      rotated2: { resize: '1920x1920', rotate: '180' },
      rotated3: { resize: '1920x1920', rotate: '270' }
    },
    processors: [:posterify]

  validates :title, presence: true
  validates_attachment :background,
    presence: true,
    content_type: { content_type: /\Aimage\/.*\z/ },
    size: { less_than: 5.megabytes }

  def display_style
    'rotated' + carousel.display_orientation.to_s
  end
end
