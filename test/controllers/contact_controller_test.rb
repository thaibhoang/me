require "test_helper"

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get contact_url
    assert_response :success
  end

  test "should create contact message" do
    assert_difference("ContactMessage.count", 1) do
      post contact_submit_url, params: {
        contact_message: {
          name: "Demo User",
          email: "demo@example.com",
          subject: "Need support",
          message: "Hello team"
        }
      }
    end

    assert_redirected_to contact_url
  end
end
