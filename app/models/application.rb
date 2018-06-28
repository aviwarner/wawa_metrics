class Application < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { message: "\"%{value}\" is already in use." }
  validates :url, presence: true, uniqueness: { message: "\"%{value}\" is already in use." }
  validates :user, presence: true

end
