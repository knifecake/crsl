class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :tiemoutable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carousels, dependent: :destroy
  has_one :settings, dependent: :destroy

  validates :name, presence: true

  after_create :initialize_settings

  def initialize_settings
    self.settings = Settings.create
  end

  protected
  def confirmation_required?
    false
  end
end
