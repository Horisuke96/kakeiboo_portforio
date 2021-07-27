require 'test_helper'

class Users::IncomeControllerTest < ActionDispatch::IntegrationTest
  test "should get daily" do
    get users_income_daily_url
    assert_response :success
  end

  test "should get new" do
    get users_income_new_url
    assert_response :success
  end

  test "should get show" do
    get users_income_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_income_edit_url
    assert_response :success
  end

end
