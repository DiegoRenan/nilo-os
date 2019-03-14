require 'test_helper'

class ServiceTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get service_types_new_url
    assert_response :success
  end

end
