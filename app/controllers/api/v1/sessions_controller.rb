module Api::V1
  class SessionsController < Devise::SessionsController
  	prepend_before_action :require_no_authentication, :only => [:create ]
  	respond_to :json

	def create
		resource = MUser.find_for_database_authentication(:email => params[:email])
		if resource.present? &&  resource.valid_password?(params[:password])
			#sign_in("user", resource)
			resource.auth_token = resource.generate_auth_token
			resource.save
			render :json=> {:success=>true, :auth_token=>resource.auth_token,:message=>"Login sucessfully",:login_user => resource }, status: 200
		
		else
			#binding.pry
			invalid_login_attempt
		end

	end

	def destroy
    sign_out(resource_name)
  end

  protected
	  def invalid_login_attempt
	    warden.custom_failure!
	    #binding.pry
	    render :json=> {:success=>false, :message=>"Error with your login or password"},status: 203 
	  end
  end
end