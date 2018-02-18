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
    end

    return redirect_to user_session_path

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
    params.require(:user).permit(:password, :phone, :email, :role)
  end

  def doctor_params
    params.require(:user).require(:doctor).permit(:first_name, :last_name, :middle_name)
  end

  def organizer_params
    params.require(:user).require(:organizer).permit(:company_name)
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end


  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end


  def after_sign_up_path_for(resource)
    super(resource)
  end


  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
