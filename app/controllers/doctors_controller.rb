class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  before_action :only_doctor_or_admin, only: [:edit,  :update]
  before_action :only_doctor_admin_or_organizer, only: [:show]
  before_action :only_admin, only: [:index, :new, :create, :destroy]


  def index
    @doctors = Doctor.all
    respond_to do |format|
      format.html { render :index }
      format.json {
         response = {
           doctors: @doctors
         }
         render json: response
       }
    end
  end


  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end


  def edit
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(first_name: doctor_params[:first_name],
     last_name: doctor_params[:last_name],
     middle_name: doctor_params[:middle_name],
     user_id: current_user.id,
     birth_date: doctor_params[:birth_date] )

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
    @event.reggistrations_count += 1
    @event.save
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
  def unfollow
    @doctor = Doctor.find(params[:doctor_id])
    @event = Event.find(params[:event_id])
    @event.reggistrations_count -= 1
    @event.save
    @doctor_event = @doctor.event_doctors.where(event_id: params[:event_id]).first.destroy
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

    def check_phone doctor
      phone = Phonelib.parse params[:phone]
      if phone.valid?
        doctor.phone = phone.to_s
        true
      else
        false
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:first_name,
        :last_name,
        :middle_name,
        :avatar,
        :birth_date,
        :event_id)
    end
end
