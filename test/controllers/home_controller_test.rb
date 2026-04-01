require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
    assert_select "title", text: "THE_ARCHITECT | Senior Software Engineer"
    assert_select "meta[name='description'][content='Portfolio, bai viet ky thuat, va kenh lien he hop tac.']"
    assert_select "link[rel='canonical'][href='#{root_url}']"
    assert_select "a[data-analytics-event='cta_click_view_project'][data-analytics-source='home_hero']"
    assert_select "a[data-analytics-event='cta_click_hire_me'][data-analytics-source='header']"
  end

  test "renders ga4 script when measurement id is configured" do
    original_value = ENV["GA_MEASUREMENT_ID"]
    ENV["GA_MEASUREMENT_ID"] = "G-TEST123"

    get root_url

    assert_response :success
    assert_select "script[src*='googletagmanager.com/gtag/js?id=G-TEST123']"
  ensure
    ENV["GA_MEASUREMENT_ID"] = original_value
  end
end
