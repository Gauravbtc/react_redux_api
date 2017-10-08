module Api::V1
  class ApiController < ApplicationController
    # Generic API stuff here
    def login_user
      #render text: "Gaurav"
      user = MUser.find_by(:auth_token=>request.headers['HTTP_AUTH_TOKEN'])
       if user.present?
        render json: {success: true,login_user: user,auth_token: user.auth_token,message: 'user found'},status: 200
       else
        render json: {success: false,login_user: nil,auth_token: nil,message: 'user not found'},status: 203
       end
     end
  end
end
