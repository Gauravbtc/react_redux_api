module Api::V1
  class SessionsController < Devise::SessionsController
  	prepend_before_action :require_no_authentication, :only => [:create ]
  	skip_before_action :verify_signed_out_user, only: :destroy

	def create
		resource = MUser.find_for_database_authentication(:email => params[:email])
		if resource.present? &&  resource.valid_password?(params[:password])
			resource.auth_token = resource.generate_auth_token
			resource.save
			render :json=> {:success=>true, :auth_token=>resource.auth_token,:message=>"Login sucessfully",:login_user => resource }, status: 200
		else
			invalid_login_attempt
		end

	end

	def destroy
		user = MUser.find_by(:auth_token=>request.headers['HTTP_AUTH_TOKEN'])
		if request.headers['HTTP_AUTH_TOKEN'].blank? || user.blank?
      render json: {success: false, message: "Invalid authentication_token" },status: 203
    else
      user.auth_token= nil
      user.save
      render json: {success: true,message: "Sign out sucessfully",user: user}      
      return
    end		
  end

  protected
	  def invalid_login_attempt
	    warden.custom_failure!
	    #binding.pry
	    render :json=> {:success=>false, :message=>"Error with your login or password"},status: 203 
	  end
  end
end