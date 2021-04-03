class Note < ApplicationRecord
  has_rich_text :content

  # Validations
  validates :name, :icon, :color, presence: true

  belongs_to :user

  scope :by_user, ->(user) { where(user_id: user) }
end
