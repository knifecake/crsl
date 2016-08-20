class Poster < ApplicationRecord
  belongs_to :carousel

  has_attached_file :background,
    styles: { preview: '600x420', carousel: '1528x1080' }

  validates :title, presence: true
  validates_attachment :background,
    presence: true,
    content_type: { content_type: /\Aimage\/.*\z/ }
end
