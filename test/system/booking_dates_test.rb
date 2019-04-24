require "application_system_test_case"

class BookingDatesTest < ApplicationSystemTestCase
  setup do
    @booking_date = booking_dates(:one)
  end

  test "visiting the index" do
    visit booking_dates_url
    assert_selector "h1", text: "Booking Dates"
  end

  test "creating a Booking date" do
    visit booking_dates_url
    click_on "New Booking Date"

    fill_in "Booking", with: @booking_date.booking_id
    fill_in "Reserved date", with: @booking_date.reserved_date
    click_on "Create Booking date"

    assert_text "Booking date was successfully created"
    click_on "Back"
  end

  test "updating a Booking date" do
    visit booking_dates_url
    click_on "Edit", match: :first

    fill_in "Booking", with: @booking_date.booking_id
    fill_in "Reserved date", with: @booking_date.reserved_date
    click_on "Update Booking date"

    assert_text "Booking date was successfully updated"
    click_on "Back"
  end

  test "destroying a Booking date" do
    visit booking_dates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Booking date was successfully destroyed"
  end
end
