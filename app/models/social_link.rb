class SocialLink < ApplicationRecord
  belongs_to :profile

  validates :platform, :url, presence: true
  validates :platform, uniqueness: { scope: :profile_id }
end
