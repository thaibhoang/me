class Skill < ApplicationRecord
  belongs_to :profile

  validates :group_name, :name, presence: true
end
