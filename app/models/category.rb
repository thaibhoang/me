class Category < ApplicationRecord
  has_many :posts, dependent: :nullify

  validates :name, :slug, presence: true
  validates :name, :slug, uniqueness: true
end
