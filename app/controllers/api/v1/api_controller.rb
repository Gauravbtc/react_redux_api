module Api::V1
  class ApiController < ApplicationController
    # Generic API stuff here

    def login_user
    	user = MUser.find_by(:auth_token=>request.headers['HTTP_AUTH_TOKEN'])
    	if user.present?
    		render json: {success: true, auth_token: user.auth_token,message: "User found",login_user: user }, status: 200
    	else
				render json: {success: false, auth_token: nil ,message: "User not found",login_user: nil }, status: 203
    	end
    end

    def get_role
    	role = Role.all
    	if role.present?
    		render json: {sucess:true,role: role,message: "Role found"},status: 200
    	else
    		render json: {sucess:true,role: nil ,message: "Role Not found"},status: 203
    	end
    end
  end
end
