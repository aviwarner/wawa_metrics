class Application < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy

  validates :name, presence: true, uniqueness: { message: "\"%{value}\" is already in use." }
  validates :url, presence: true, uniqueness: { message: "\"%{value}\" is already in use." }
  validates :user, presence: true

end
