require 'test_helper'

class Users::DepositsControllerTest < ActionDispatch::IntegrationTest
  test "should get daily" do
    get users_deposits_daily_url
    assert_response :success
  end

  test "should get edit" do
    get users_deposits_edit_url
    assert_response :success
  end

  test "should get new" do
    get users_deposits_new_url
    assert_response :success
  end

  test "should get show" do
    get users_deposits_show_url
    assert_response :success
  end

end
