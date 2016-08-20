class Poster < ApplicationRecord
  belongs_to :carousel

  has_attached_file :background

  validates :title, presence: true
  validates_attachment :background,
    presence: true,
    content_type: { content_type: /\Aimage\/.*\z/ }
end
