require 'test_helper'

class ProductGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_genres_index_url
    assert_response :success
  end

  test "should get show" do
    get product_genres_show_url
    assert_response :success
  end

end
