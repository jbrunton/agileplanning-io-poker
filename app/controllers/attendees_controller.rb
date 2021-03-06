class AttendeesController < ApplicationController
  include WebsocketHelper
  include HistoryHelper

  before_action :set_attendee, only: [:show, :edit, :update, :destroy, :rejoin]
  before_action :set_room, only: [:create, :new, :index]

  # GET /attendees
  # GET /attendees.json
  def index
    @attendees = @room.attendees
  end

  # GET /attendees/1
  # GET /attendees/1.json
  def show
  end

  # GET /attendees/new
  def new
    @attendee = Attendee.new
    @record = [@room, @attendee]
  end

  # GET /attendees/1/edit
  def edit
    @record = @attendee
  end

  # POST /attendees
  # POST /attendees.json
  def create
    @attendee = @room.attendees.new(attendee_params)

    respond_to do |format|
      if @attendee.save
        append_attendee_history(@attendee)
        notify_attendee_update(@attendee)
        format.html { redirect_to @room, notice: 'Attendee was successfully created.' }
        format.json { render :show, status: :created, location: @attendee }
      else
        format.html { render :new }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /attendees/1/rejoin
  # POST /attendees/1/rejoin.json
  def rejoin
    append_attendee_history(@attendee)
    respond_to do |format|
      format.html { redirect_to @room, notice: 'Attendee was successfully created.' }
      format.json { render :show, status: :created, location: @attendee }
    end
  end

  # PATCH/PUT /attendees/1
  # PATCH/PUT /attendees/1.json
  def update
    respond_to do |format|
      if @attendee.update(attendee_params)
        notify_attendee_update(@attendee)
        format.html { redirect_to @attendee, notice: 'Attendee was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendee }
      else
        format.html { render :edit }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendee.destroy
    notify_attendee_update(@attendee)
    respond_to do |format|
      format.html { redirect_to room_attendees_url(@room), notice: 'Attendee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id])
      @room = @attendee.room
    end

    def set_room
      @room = Room.find(params[:room_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendee_params
      params.require(:attendee).permit(:name, :score, :ready, :room_id)
    end
end
