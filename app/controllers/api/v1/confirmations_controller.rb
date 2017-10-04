module Api::V1
  class ConfirmationsController < Devise::ConfirmationsController
  	def show
  		resource = resource_class.confirm_by_token(params[:confirmation_token])
  		if resource.errors.empty?
        resource.auth_token = resource.generate_auth_token
  		  resource.save
	      render json: {success: true, message: "Your account has been confirmed",login_user: resource,auth_token: resource.auth_token},status: 200
   	 	else
   	 		render json: {success: false, message: resource.errors,login_user: nil,auth_token: nil,errors: resource.errors},status: 203
   	 		#render json: {errors: resource.errors, status: :unprocessable_entity },status: 203
   		 end
  	end
  end
end
