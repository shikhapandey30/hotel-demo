class HotelRoomSerializer < ActiveModel::Serializer  
  attributes :id, :name, :max_adults, :max_children 
end