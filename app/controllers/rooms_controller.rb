class RoomsController < ApplicationController
  include RoomsHelper

  before_action :set_room, only: [:show, :admin, :show_scores, :reset, :destroy]
  before_action :set_attendee, only: [:show]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/1/admin
  # GET /rooms/1/admin.json
  def admin
    cookies.permanent['room_id'] = @room.id
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to admin_room_path(@room), notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1/show_scores
  # PATCH/PUT /rooms/1/show_scores.json
  def show_scores
    respond_to do |format|
      @room.update(show_scores: true)
      notify_room_update(@room)
      format.html { redirect_to admin_room_path(@room), notice: 'Room was successfully updated.' }
      format.json { render :show, status: :ok, location: @room }
    end
  end

  def reset
    respond_to do |format|
      @room.update(show_scores: false)
      @room.attendees.each { |attendee| attendee.update(score: nil) }
      notify_room_update(@room)
      format.html { redirect_to admin_room_path(@room), notice: 'Room was successfully updated.' }
      format.json { render :show, status: :ok, location: @room }
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    def set_attendee
      attendee = Attendee.find_by_id(cookies['attendee_id'])
      @attendee = attendee if attendee.try(:room) == @room
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :show_scores)
    end
end
