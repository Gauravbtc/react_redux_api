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
        image_url = URI.join(request.url, @user.photo.url)
        render json: @user, serializer: UserSerializer,image_url: image_url, message: "Your are signed in successfully...",success: true,status: 200
        # render json: {success: true, user: @user}, status: 200
      else
        render json: {success: false, error: "Error"}, status: 401
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render json: {success: true,user: @user},status: 200
      else
        render json: {success: false, error: "Error"},status: 401
      end
    end


    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        render json: {success: true,user: @user},status: 200
      else
        render json: {success: false,error: "Error"},status: 401
      end
    end

    private 
      def user_params
        params.permit(:firstname,:lastname,:gender,:email,:photo)
      end
  end
end