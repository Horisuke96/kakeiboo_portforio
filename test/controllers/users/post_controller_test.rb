require 'test_helper'

class Users::PostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_post_index_url
    assert_response :success
  end

  test "should get show" do
    get users_post_show_url
    assert_response :success
  end

  test "should get new" do
    get users_post_new_url
    assert_response :success
  end

  test "should get edit" do
    get users_post_edit_url
    assert_response :success
  end

end
