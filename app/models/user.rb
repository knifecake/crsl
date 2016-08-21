class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  has_many :carousels, dependent: :destroy
  has_one :settings, dependent: :destroy

  validates :name, presence: true

  after_create :initialize_settings

  def initialize_settings
    self.settings = Settings.create
  end
end
