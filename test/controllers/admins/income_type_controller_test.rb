require 'test_helper'

class Admins::IncomeTypeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_income_type_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_income_type_edit_url
    assert_response :success
  end

end
