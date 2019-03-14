require 'test_helper'

class ServiceStatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get service_statuses_new_url
    assert_response :success
  end

end
