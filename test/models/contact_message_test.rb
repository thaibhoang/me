require "test_helper"

class ContactMessageTest < ActiveSupport::TestCase
  test "validates email format" do
    message = ContactMessage.new(
      name: "Demo",
      email: "invalid-email",
      subject: "Subject",
      message: "Body"
    )

    assert_not message.valid?
    assert_includes message.errors[:email], "is invalid"
  end

  test "defaults to unread status" do
    message = ContactMessage.create!(
      name: "Demo",
      email: "demo@example.com",
      subject: "Subject",
      message: "Body"
    )

    assert_equal "unread", message.status
  end
end
