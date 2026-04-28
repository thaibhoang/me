class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
  has_many :project_tags, dependent: :destroy
  has_many :projects, through: :project_tags

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true
end
