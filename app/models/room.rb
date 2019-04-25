class Room < ApplicationRecord
	belongs_to :hotel
	has_many :bookings

	scope :available?, -> (check_in, check_out=nil) {
   available_rooms(check_in, check_out).present? }

  # Scope for finding all the available rooms
  scope :available_rooms, -> (check_in, check_out=nil) {
    byebug
    check_out = check_in if check_out.nil?
    # Fetching all the booked rooms in the particular date range 
    hotel_rooms = includes(:bookings=>:booking_dates).where("booking_dates.reserved_date": check_in..check_out)
    # Filtering all the booked rooms and finding out the available rooms for particular
    where.not(id: hotel_rooms.map(&:id))
  }


  # Checking if particular room is avaliable or not
  def available?(check_in, check_out=nil)
    check_out = check_in if check_out.nil?
    # we are also able to search for one day booking 
    # dates we are taking as yyyy/mm/dd
    # example available("2016/10/9")
    # example available("2016/10/2","2016/10/9")
    # searching bookings using check_in and check_out date range
    bookings.joins(:booking_dates).where("booking_dates.reserved_date": check_in..check_out).blank?
  end

end
