class ContactMessage < ApplicationRecord
  enum :status, { unread: 0, read: 1, archived: 2 }

  EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  validates :name, :email, :subject, :message, presence: true
  validates :email, format: { with: EMAIL_REGEX }
end
