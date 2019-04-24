json.extract! booking, :id, :check_in, :check_out, :hotel_id, :room_id, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
