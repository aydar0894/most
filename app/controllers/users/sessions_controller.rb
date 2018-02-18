class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @navigation_page = :sign_in
    super
  end


  def user_exists
    if User.find_for_database_authentication({login: params[:login]}) 
      return render json: {user_exists: true}
      #, status: 200
    else
      return render json: {user_exists: false}
      #, status: 201
    end
  end


  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:user_exists, keys: [:login])
  end
end
