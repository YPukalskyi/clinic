require "test_helper"

class Patient::AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patient_appointments_index_url
    assert_response :success
  end
end
