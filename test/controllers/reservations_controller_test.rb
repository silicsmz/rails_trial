require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservations_index_url
    assert_response :success
  end

  test "should get register" do
    get reservations_register_url
    assert_response :success
  end

  test "should get cancel" do
    get reservations_cancel_url
    assert_response :success
  end

  test "should get delete" do
    get reservations_delete_url
    assert_response :success
  end

end
