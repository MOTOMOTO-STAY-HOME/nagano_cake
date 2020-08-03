require 'test_helper'

class ShipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ships_index_url
    assert_response :success
  end

  test "should get edit" do
    get ships_edit_url
    assert_response :success
  end

end
