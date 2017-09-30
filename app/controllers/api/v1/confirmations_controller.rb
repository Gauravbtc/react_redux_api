module Api::V1
  class ConfirmationsController < Devise::ConfirmationsController
  	#respond_to :json
  	def show
  		resource = resource_class.confirm_by_token(params[:confirmation_token])
  		if resource.errors.empty?
        binding.pry
        resource.auth_token = resource.generate_auth_token
  		  resource.save
	      render json: {success: true, message: "Your account has been confirmed",login_user: resource,auth_token: resource.auth_token},status: 200
        #binding.pry
   	 	else
   	 		render json: {errors: resource.errors, status: :unprocessable_entity },status: 203
   		 end
  	end
  end
end
