module Api::V1
  class PasswordsController < Devise::PasswordsController
    prepend_before_action :require_no_authentication

  	def edit
      #binding.pry
	    # self.resource = resource_class.new
	    # set_minimum_password_length
	    # resource.reset_password_token = params[:reset_password_token]

  	end

  	def update
      user = MUser.find_by(reset_password_token: params[:reset_password_token])
        if user.present?
          if user.update(password: params[:password], password_confirmation: params[:password_confirmation],auth_token: user.generate_auth_token)
             render json: {success: true, message: "Password Updated Sucessfully",login_user: user,auth_token: user.auth_token},status: 200
          else
            render json: {success: true, message: user.errors.full_messages,login_user: user,auth_token: nil},status: 203
          end
        else
          render json: {success: false, message: "Invalid valid user",login_user: nil,auth_token: nil},status: 203
        end  
  	end

    def create
      user = MUser.find_by(email: params[:email])
      if user.present?
        user.send_reset_password_instructions
        render json: {success: true, message: "Please check your mail",login_user: user,auth_token: nil},status: 200
      else
        render json: {success: false, message: "Invalid Email address",login_user: nil,auth_token: nil,errors: nil},status: 203
      end
    end
  end
end