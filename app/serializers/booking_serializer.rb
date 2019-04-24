class BookingSerializer < ActiveModel::Serializer  
  attributes :id, :check_in11, :check_out, :room_name, :category_name, :price, :hotel_room_id, :hotel_category_id
  
  def room_name
  	object.hotel_room.name
  end

  def category_name
  	object.hotel_room.hotel_category.name
  end

  def hotel_category_id
  	object.hotel_room.hotel_category_id
  end

  def price
  	object.hotel_room.hotel_category.price
  end
end