require "test_helper"

class AdminAccessTest < ActionDispatch::IntegrationTest
  test "redirects guests away from admin dashboard" do
    get "/admin"

    assert_redirected_to new_admin_user_session_path
  end

  test "allows authenticated admin user to access dashboard" do
    admin = AdminUser.create!(
      email: "admin-test@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    sign_in admin

    get "/admin"

    assert_response :success
  end
end
