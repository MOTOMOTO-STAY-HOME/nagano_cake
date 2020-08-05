require 'test_helper'

class Admins::ProductGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_products_genere_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_products_genere_edit_url
    assert_response :success
  end

end
