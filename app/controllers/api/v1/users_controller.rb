module Api::V1
  class UsersController < ApiController
    # GET /v1/users
    def index
      render json: User.all
    end

    def show
    	@user = User.find(params[:id])
    	render json: @user
    end

    def create
      @user = User.new(user_params) 
      if @user.save
        render json: {success: true, user: @user}, status: 200
      else
        render json: {success: false, error: "Error"}, status: 401
      end
    end


    private 
      def user_params
        params.require(:user).permit(:firstname,:lastname,:gender,:email)
      end
  end
end