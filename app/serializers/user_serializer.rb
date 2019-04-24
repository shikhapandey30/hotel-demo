class UserSerializer < ActiveModel::Serializer
  attributes :id, :authentication_token, :first_name, :last_name, :email, :mobile
end 