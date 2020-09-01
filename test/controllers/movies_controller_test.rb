require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get id" do
    get movies_id_url
    assert_response :success
  end

end
