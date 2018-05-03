class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  def new
    # abort User.roles.inspect
    @navigation_page = :sign_up
    @user = User.new
  end


  def create
    @user = User.create(user_params)
    # abort @user.role.inspect
    if @user.doctor?
      @doctor = Doctor.new(doctor_params)
      @doctor.user_id = @user.id
      @doctor.save
    elsif @user.organizer?
      @organizer = Organizer.new(organizer_params)
      @organizer.user_id = @user.id
      @organizer.save
    elsif @user.operator?
      @operator = Operator.new(operator_params)
      generated_password = Devise.friendly_token.first(8)
      pp generated_password
      @user.role = 'operator'
      @user.password = @user.password_confirmation = generated_password
      @user.save
      @operator.user_id = @user.id
      @operator.save
    end

    if @user.operator?
      return redirect_to root_path
    else
      return redirect_to user_session_path
    end
  end


  def edit
    super
  end


  def update
    super
  end


  def destroy
    super
  end


  def cancel
    super
  end

  protected

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :phone, :email, :role)
  end

  def doctor_params
    params.require(:user).require(:doctor).permit(:first_name, :last_name, :middle_name, :avatar)
  end

  def operator_params
    params.require(:user).require(:doctor).permit(:first_name, :last_name, :middle_name, :avatar)
  end

  def organizer_params
    params.require(:user).require(:organizer).permit(:company_name, :logo)
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:password_confirmation])
  end


  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:password_confirmation])
  end


  def after_sign_up_path_for(resource)
    super(resource)
  end


  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
