require 'test_helper'

class ServiceAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_attachment = service_attachments(:one)
  end

  test "should get index" do
    get service_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_service_attachment_url
    assert_response :success
  end

  test "should create service_attachment" do
    assert_difference('ServiceAttachment.count') do
      post service_attachments_url, params: { service_attachment: { picture: @service_attachment.picture, service_id: @service_attachment.service_id } }
    end

    assert_redirected_to service_attachment_url(ServiceAttachment.last)
  end

  test "should show service_attachment" do
    get service_attachment_url(@service_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_attachment_url(@service_attachment)
    assert_response :success
  end

  test "should update service_attachment" do
    patch service_attachment_url(@service_attachment), params: { service_attachment: { picture: @service_attachment.picture, service_id: @service_attachment.service_id } }
    assert_redirected_to service_attachment_url(@service_attachment)
  end

  test "should destroy service_attachment" do
    assert_difference('ServiceAttachment.count', -1) do
      delete service_attachment_url(@service_attachment)
    end

    assert_redirected_to service_attachments_url
  end
end
