require 'test_helper'

class PostersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get posters_new_url
    assert_response :success
  end

  test "should get create" do
    get posters_create_url
    assert_response :success
  end

  test "should get show" do
    get posters_show_url
    assert_response :success
  end

  test "should get destroy" do
    get posters_destroy_url
    assert_response :success
  end

end
