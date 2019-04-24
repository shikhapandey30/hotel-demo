require 'test_helper'

class BookingDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_date = booking_dates(:one)
  end

  test "should get index" do
    get booking_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_date_url
    assert_response :success
  end

  test "should create booking_date" do
    assert_difference('BookingDate.count') do
      post booking_dates_url, params: { booking_date: { booking_id: @booking_date.booking_id, reserved_date: @booking_date.reserved_date } }
    end

    assert_redirected_to booking_date_url(BookingDate.last)
  end

  test "should show booking_date" do
    get booking_date_url(@booking_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_date_url(@booking_date)
    assert_response :success
  end

  test "should update booking_date" do
    patch booking_date_url(@booking_date), params: { booking_date: { booking_id: @booking_date.booking_id, reserved_date: @booking_date.reserved_date } }
    assert_redirected_to booking_date_url(@booking_date)
  end

  test "should destroy booking_date" do
    assert_difference('BookingDate.count', -1) do
      delete booking_date_url(@booking_date)
    end

    assert_redirected_to booking_dates_url
  end
end
