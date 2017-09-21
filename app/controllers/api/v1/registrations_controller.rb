module Api::V1
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

  def create
    user = MUser.new(user_params)
    if user.save
      user.update(auth_token: user.generate_auth_token)
      render :json=> user.as_json(:reg_user =>user, :message=>"Regestrion done"), :status=>201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end
    # Generic API stuff here

  private
    def user_params
      params.permit(:email, :password, :password_confirmation, :auth_token)
    end
  end
end