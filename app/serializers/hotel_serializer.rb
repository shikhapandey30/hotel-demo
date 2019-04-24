class HotelSerializer < ActiveModel::Serializer 
  attributes :id, :name, :rooms

  def available_rooms_count
  	object.rooms.count
  end

  # hotel_rooms method for fetching available rooms
  def rooms
  	object.available_rooms @instance_options[:check_in], @instance_options[:check_out]
  end

  has_many :rooms
end