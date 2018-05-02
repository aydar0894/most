class OrganizersController < ApplicationController
  before_action :set_organizer, only: [:edit, :update, :show, :destroy]
  before_action :only_admin, only: [:index, :new, :create, :destroy]
  before_action :only_organizer, only: [:edit, :update, :my_events, :statistics]

  # GET /organizers
  # GET /organizers.json
  def index
    @organizers = Organizer.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: {organizers: @organizers}}
    end
  end

  def my_events
    @all_events = Event.where(organizer_id: Organizer.find_by(user_id: current_user.id).id)
    current_date = DateTime.current
    @current_events = @all_events.where('start <= ? AND finish >= ?', current_date, current_date)
    @upcoming_events = @all_events.where('start >= ?', current_date)
    @archive_events = @all_events.where('finish <= ?', current_date)
    respond_to do |format|
      format.html { render :my_events }
      format.json {
         response = {
           all_events: @all_events,
           current_events: @current_events,
           upcoming_events: @upcoming_events,
           archive_events: @archive_events
         }
         render json: response
       }
    end
  end

  def statistics
    current_date = DateTime.current
    @all_events = Event.where(organizer_id: Organizer.find_by(user_id: current_user.id).id)
    @archive_events = @all_events.where('finish <= ?', current_date)
    @participating_percentage = 0
    @total_regs = 0
    @total_parts = 0
    @archive_events.each do |event|
      @total_regs += event.reggistrations_count
      @total_parts += event.participants_count
    end

    if @total_parts!= 0
      @participating_percentage = @total_regs/@total_parts * 100
    else
      @participating_percentage = 100
    end

    respond_to do |format|
      format.html { render :statistics }
      format.json {
         response = {
           all_events: @all_events,
           archive_events: @archive_events,
           participating_percentage: @participating_percentage,
           total_regs: @total_regs,
           total_parts: @total_parts
         }
         render json: response
       }
    end

  end

  # GET /organizers/1
  # GET /organizers/1.json
  # def show

  # end

  # GET /organizers/new
  def new
    @organizer = Organizer.new
  end

  # GET /organizers/1/edit
  def edit
  end

  # POST /organizers
  # POST /organizers.json
  def create
    @organizer = Organizer.new(organizer_params)

    respond_to do |format|
      if @organizer.save
        format.html { redirect_to @organizer, notice: 'Organizer was successfully created.' }
        format.json { render :show, status: :created, location: @organizer }
      else
        format.html { render :new }
        format.json { render json: @organizer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizers/1
  # PATCH/PUT /organizers/1.json
  def update
    respond_to do |format|
      if @organizer.update(organizer_params)
        format.html { redirect_to @organizer, notice: 'Organizer was successfully updated.' }
        format.json { render :show, status: :ok, location: @organizer }
      else
        format.html { render :edit }
        format.json { render json: @organizer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizers/1
  # DELETE /organizers/1.json
  def destroy
    @organizer.destroy
    respond_to do |format|
      format.html { redirect_to organizers_url, notice: 'Organizer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organizer
      @organizer = Organizer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organizer_params
      params.require(:organizer).permit(:user_id, :company_name)
    end
end
