class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname ,:lastname ,:gender ,:email
end
