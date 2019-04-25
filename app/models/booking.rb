class Booking < ApplicationRecord
	belongs_to :room
	has_many :booking_dates, dependent: :destroy
	belongs_to :user
	# validate :room_availability_check
  # callback to save booking dates with in booking dates table
  after_save :create_or_update_booking_dates
  
  # These attributes should always be present
  validates :check_in, :check_out, :room_id, :user_id, presence: true

  # Custom valudation for check in date
  # Check in date cannot be in the past
   validate :check_in_cannot_be_in_the_past
   # validate :available_rooms

  # Custom valudation for check out date
  # Check out date should not be less than check in date
   validate :check_out_should_be_less_than_check_in

  # Custom Validation for limiting the booking for 6 months
  # Allows booking up to 6 months in advance for room reservations
   validate :check_out_cannot_be_more_than_6_months

  # Checking the hotel room availability
   validate :room_availability_check

  # Method for allowing booking only up to 6 months
  def check_out_cannot_be_more_than_6_months
    if check_out.present? && check_out > Date.today+6.months
      errors.add(:check_out, "can't be more than 6 months. Booking up to 6 months in advance.")
    end
  end 

  # Method for validating check out date 
  # check_out date should be less than check_in date
  def check_out_should_be_less_than_check_in
    if check_in.present? && check_out.present? && check_out < check_in
      errors.add(:check_out, "can't be less than check in date")
    end
  end 

  # Method for validating check in date 
  # check_in date cannot be in the past
  def check_in_cannot_be_in_the_past
    if check_in.present? && check_in < Date.today
      errors.add(:check_in, "can't be in the past")
    end
  end 
  
  # Method to save booking dates with in booking dates table
  def create_or_update_booking_dates
    byebug
    if check_in_changed? || check_out_changed?
      # Delete all booking dates if check in or check out changed
      booking_dates.delete_all
      # Adding all the dates of the check_in and check_out range into the reserved dates
      (check_in..check_out).each do |reserved_date|  
        # Createing booking dates with specified reserved_date
        booking_dates.create(reserved_date: reserved_date)
      end
    end
  end

  # Method to validating room availability
  def room_availability_check
    if room.present? && !room.available?(check_in, check_out)
      errors.add(:room, "is not available right now and booked already")
    end
  end

end
