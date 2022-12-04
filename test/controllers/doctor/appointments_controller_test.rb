require "test_helper"

class Doctor::AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctor_appointments_index_url
    assert_response :success
  end
end
