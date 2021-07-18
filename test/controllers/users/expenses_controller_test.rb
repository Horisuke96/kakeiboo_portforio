require 'test_helper'

class Users::ExpensesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_expenses_new_url
    assert_response :success
  end

  test "should get edit" do
    get users_expenses_edit_url
    assert_response :success
  end

  test "should get daily" do
    get users_expenses_daily_url
    assert_response :success
  end

  test "should get monthly" do
    get users_expenses_monthly_url
    assert_response :success
  end

end
