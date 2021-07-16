require 'test_helper'

class Admins::ExpenseTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_expense_types_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_expense_types_edit_url
    assert_response :success
  end

end
