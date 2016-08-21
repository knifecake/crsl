require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get settings_update_url
    assert_response :success
  end

end
