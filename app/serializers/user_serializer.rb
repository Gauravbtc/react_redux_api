class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname ,:lastname ,:gender ,:email,:photo

  def photo
  	@instance_options[:image_url]
  end
end
