class ProjectLink < ApplicationRecord
  belongs_to :project

  validates :kind, :label, :url, presence: true
end
