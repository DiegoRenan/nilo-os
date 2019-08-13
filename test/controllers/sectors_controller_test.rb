require 'test_helper'

class SectorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sectors_new_url
    assert_response :success
  end

end
