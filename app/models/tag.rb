class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  validates :name, :slug, presence: true
  validates :name, :slug, uniqueness: true
end
