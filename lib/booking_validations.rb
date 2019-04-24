module BookingValidations
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
    if hotel_room.present? && !hotel_room.available?(check_in, check_out)
      errors.add(:hotel_room, "is not available right now and booked already")
    end
  end

end