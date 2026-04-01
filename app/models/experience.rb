class Experience < ApplicationRecord
  belongs_to :profile

  validates :role, :company, presence: true
end
