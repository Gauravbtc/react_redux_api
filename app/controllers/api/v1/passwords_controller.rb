module Api::V1
  class PasswordsController < Devise::PasswordsController
  	def edit
	  #   self.resource = resource_class.new
	  #   set_minimum_password_length
	  #   resource.reset_password_token = params[:reset_password_token]
  	end

  	def update
  		super
  	end
    # Generic API stuff here
  end
end