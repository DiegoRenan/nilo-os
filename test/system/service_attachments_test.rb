require "application_system_test_case"

class ServiceAttachmentsTest < ApplicationSystemTestCase
  setup do
    @service_attachment = service_attachments(:one)
  end

  test "visiting the index" do
    visit service_attachments_url
    assert_selector "h1", text: "Service Attachments"
  end

  test "creating a Service attachment" do
    visit service_attachments_url
    click_on "New Service Attachment"

    fill_in "Picture", with: @service_attachment.picture
    fill_in "Service", with: @service_attachment.service_id
    click_on "Create Service attachment"

    assert_text "Service attachment was successfully created"
    click_on "Back"
  end

  test "updating a Service attachment" do
    visit service_attachments_url
    click_on "Edit", match: :first

    fill_in "Picture", with: @service_attachment.picture
    fill_in "Service", with: @service_attachment.service_id
    click_on "Update Service attachment"

    assert_text "Service attachment was successfully updated"
    click_on "Back"
  end

  test "destroying a Service attachment" do
    visit service_attachments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Service attachment was successfully destroyed"
  end
end
