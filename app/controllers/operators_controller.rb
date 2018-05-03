class OperatorsController < ApplicationController
  before_action :set_operator, only: [:show, :edit, :update, :destroy]
  before_action :only_operator, only: [:api_authorize_event_doctor_in, :api_authorize_event_doctor_out, :check_event_doctor_status]
  before_action :only_admin_or_organizer, only: [:index, :new, :create, :destroy]
  before_action :only_operator_admin_or_organizer , only: [:show, :edit, :update]
  # GET /operators
  # GET /operators.json
  def index
    if params["organizer_id"]
      @organizer = Organizer.find(params["organizer_id"])
      @operators = Operator.where(organizer_id: params["organizer_id"])
    else
      @operators = Operator.all
    end

    respond_to do |format|
      format.html { render :index }
      format.json {
         response = {
           operators: @operators
         }
         render json: response
       }
    end
  end

  # GET /operators/1
  # GET /operators/1.json
  def show
  end

  def check_event_doctor_status
    @event_doctor = EventDoctor.where(event_id: params[:event_id], doctor_id: params[:doctor_id])
    return render json: @event_doctor.status
  end

  def api_authorize_event_doctor_in
    event = Event.find(params[:event_id])
    return render json: {"error": "incorrect event"} if event.start > DateTime.current || event.finish <= DateTime.current
    @event_doctor = EventDoctor.where(event_id: params[:event_id], doctor_id: params[:doctor_id])
    return render json: {"error": "user is not registered on this event"} if !@event_doctor
    @event_doctor.update(last_in: DateTime.current, status: 1)
  end

  def api_authorize_event_doctor_out
    event = Event.find(params[:event_id])
    return render json: {"error": "incorrect event"} if event.start > DateTime.current || event.finish <= DateTime.current
    @event_doctor = EventDoctor.where(event_id: params[:event_id], doctor_id: params[:doctor_id])
    return render json: {"error": "user is not registered on this event"} if !@event_doctor
    @event_doctor.update(last_out: DateTime.current, status: 0)
    @event_doctor.update(event_time: @event_doctor.event_time + (@event_doctor.last_out - @event_doctor.last_in))
  end

  # GET /operators/new
  def new
    @operator = Operator.new
  end

  # GET /operators/1/edit
  def edit
  end

  # POST /operators
  # POST /operators.json
  def create
    generated_password = Devise.friendly_token.first(8)
    pp generated_password
    @user = User.new(user_params)
    @user.role = 'operator'
    @user.password = generated_password
    @user.save
    @operator = Operator.new(operator_params)
    @operator.user_id = @user.id
    @operator.organizer_id = current_user.profile.id if current_user.organizer?
    # RegistrationMailer.welcome(user, generated_password).deliver
    respond_to do |format|
      if @operator.save
        format.html { redirect_to @operator, notice: 'Operator was successfully created.' }
        format.json { render :show, status: :created, location: @operator }
      else
        format.html { render :new }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operators/1
  # PATCH/PUT /operators/1.json
  def update
    respond_to do |format|
      if @operator.update(operator_params)
        format.html { redirect_to @operator, notice: 'Operator was successfully updated.' }
        format.json { render :show, status: :ok, location: @operator }
      else
        format.html { render :edit }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operators/1
  # DELETE /operators/1.json
  def destroy
    @operator.destroy
    respond_to do |format|
      format.html { redirect_to operators_url, notice: 'Operator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operator
      @operator = Operator.find(params[:id])
    end

    def user_params
      params.require(:operator).require(:user).permit(:phone, :email, :role)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operator_params
      params.require(:operator).permit(:first_name,
       :last_name,
       :middle_name,
       :user_id)
    end
end
