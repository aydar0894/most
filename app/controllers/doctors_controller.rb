class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  before_action :only_doctor, only: [:show, :edit,  :update]
  before_action :only_admin, only: [:index, :new, :create, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @events_available = Event.all
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(first_name: doctor_params[:first_name],
     last_name: doctor_params[:last_name],
     middle_name: doctor_params[:middle_name],
     birth_date: doctor_params[:birth_date],
     user_id: current_user.id)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /doctors/1/events/1
  def register
    @doctor = Doctor.find(params[:doctor_id])
    @doctor_event = @doctor.event_doctors.build(:status => 0, :event_id => params[:event_id])
    @event = @doctor_event.event
    if @doctor_event.save
      respond_to do |format|
        format.html { redirect_to doctor_event_path(@doctor, @event), notice: 'Вы зарегистрировались на мероприятие.' }
        format.json { render :show, status: :created, location: [@doctor, @event] }
      end
    else
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1/events/1
  def unregister
    @doctor = Doctor.find(params[:doctor_id])
    @doctor_event = @doctor.event_doctors.find(:event_id => params[:event_id])
    @doctor_event.destroy
    respond_to do |format|
      format.html { redirect_to doctor_events_path(@doctor), notice: 'Вы отказались от посещения мероприятие.' }
      format.json { head :no_content}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:first_name, :last_name, :middle_name, :birth_date, :event_id)
    end
end
