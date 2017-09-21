module Api::V1
  class ConfirmationsController < Devise::ConfirmationsController 
  	respond_to :json
  	def show
  		resource = resource_class.confirm_by_token(params[:confirmation_token])
  		if resource.errors.empty?
	      render :json=> {:success=>true, :message=>"Your account has been confirmed",:login_user => resource}
   	 	else
   	 		render :json => {:errors =>resource.errors, status: :unprocessable_entity }
   		 end
  	end
  end
end