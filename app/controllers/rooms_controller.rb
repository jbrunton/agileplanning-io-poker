class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :admin, :show_scores, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @attendee = Attendee.find(cookies['attendee_id']) unless cookies['attendee_id'].nil?
  end

  # GET /rooms/1/admin
  # GET /rooms/1/admin.json
  def admin
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.permit(:room).permit(:show_scores)
    end
end
