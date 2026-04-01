class Project < ApplicationRecord
  has_many :project_links, dependent: :destroy
  has_many :project_visuals, dependent: :destroy
  has_many :project_metrics, dependent: :destroy
  has_many :project_achievements, dependent: :destroy

  enum :status, { draft: 0, published: 1 }

  validates :title, :slug, :summary, presence: true
  validates :slug, uniqueness: true

  scope :latest, -> { order(published_at: :desc, created_at: :desc) }
  scope :published_recent, -> { published.latest }
end
