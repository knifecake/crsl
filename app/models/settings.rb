class Settings < ApplicationRecord
  belongs_to :user

  attribute :display_orientation, :string, default: 'portrait'
  attribute :carousel_speed, :integer, default: 10_000 # 10 seconds

  validates :display_orientation, presence: true
  validates :carousel_speed, presence: true, numericality: { only_integer: true }
end
