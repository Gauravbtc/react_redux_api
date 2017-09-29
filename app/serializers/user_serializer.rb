class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname ,:lastname ,:gender ,:email, :user_photo,:m_user_id

  def user_photo
  	@instance_options[:image_url]
  end
end
