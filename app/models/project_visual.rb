class ProjectVisual < ApplicationRecord
  belongs_to :project

  validates :image_url, presence: true
end
