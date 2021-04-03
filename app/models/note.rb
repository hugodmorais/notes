class Note < ApplicationRecord
  has_rich_text :content

  # Validations
  validates :name, :icon, :color, presence: true
end
