class Profile < ApplicationRecord
  has_many :experiences, -> { order(position: :asc) }, dependent: :destroy
  has_many :skills, -> { order(position: :asc) }, dependent: :destroy
  has_many :social_links, -> { order(position: :asc) }, dependent: :destroy

  validates :full_name, presence: true
end
