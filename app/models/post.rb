class Post < ApplicationRecord
  belongs_to :category, optional: true
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  enum :status, { draft: 0, published: 1 }

  validates :title, :slug, :excerpt, :content, presence: true
  validates :slug, uniqueness: true

  scope :latest, -> { order(published_at: :desc, created_at: :desc) }
  scope :published_recent, -> { published.latest }
end
