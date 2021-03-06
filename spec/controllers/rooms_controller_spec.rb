require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe RoomsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Room. As you add validations to Room, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { show_scores: false }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RoomsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let!(:room) { create(:room) }

  describe "GET #index" do
    it "assigns all rooms as @rooms" do
      get :index, {}, valid_session
      expect(assigns(:rooms)).to eq([room])
    end
  end

  describe "GET #show" do
    it "assigns the requested room as @room" do
      get :show, {:id => room.to_param}, valid_session
      expect(assigns(:room)).to eq(room)
    end

    context "when the room_history cookie includes an attendee for the room" do
      let(:attendee) { create(:attendee, room: room) }

      it "assigns the attendee" do
        request.cookies['attendee_history'] = "attendee:#{attendee.id}"
        get :show, {:id => room.to_param}, valid_session
        expect(assigns(:attendee)).to eq(attendee)
      end
    end

    context "when the attendee cookie is for a different room" do
      let(:attendee) { create(:attendee) }

      it "does not assign the attendee" do
        request.cookies['attendee_history'] = "attendee:#{attendee.id}"
        get :show, {:id => room.to_param}, valid_session
        expect(assigns(:attendee)).to be_nil
      end
    end
  end

  describe "GET #admin" do
    it "assigns the requested room as @room" do
      get :admin, {:id => room.to_param}, valid_session
      expect(assigns(:room)).to eq(room)
    end

    it "drops a room_id cookie" do
      get :admin, {:id => room.to_param}, valid_session
      expect(response.cookies['admin_history']).to eq("admin:#{room.id}")
    end
  end

  describe "GET #new" do
    it "assigns a new room as @room" do
      get :new, {}, valid_session
      expect(assigns(:room)).to be_a_new(Room)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Room" do
        expect {
          post :create, {:room => valid_attributes}, valid_session
        }.to change(Room, :count).by(1)
      end

      it "assigns a newly created room as @room" do
        post :create, {:room => valid_attributes}, valid_session
        expect(assigns(:room)).to be_a(Room)
        expect(assigns(:room)).to be_persisted
      end

      it "redirects to the created room" do
        post :create, {:room => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_room_path(Room.last))
      end
    end
  end

  describe "PUT #show_scores" do
    it "updates the requested room" do
      put :show_scores, {:id => room.to_param}, valid_session
      room.reload
      expect(room.show_scores).to eq(true)
    end

    it "notifies the channel" do
      expect(controller).to receive(:notify_room_update).with(room)
      put :show_scores, {:id => room.to_param}, valid_session
    end

    it "redirects to the admin action" do
      put :show_scores, {:id => room.to_param, :room => valid_attributes}, valid_session
      expect(response).to redirect_to(admin_room_path(room))
    end
  end

  describe "PUT #reset" do
    let!(:attendee) { create(:attendee, room: room, score: "2") }

    it "resets the scores" do
      put :reset, {:id => room.to_param}, valid_session
      attendee.reload
      expect(attendee.score).to be_nil
    end

    it "notifies the channel" do
      expect(controller).to receive(:notify_room_update).with(room)
      put :reset, {:id => room.to_param}, valid_session
    end

    it "resets the room" do
      put :reset, {:id => room.to_param}, valid_session
      room.reload
      expect(room.show_scores).to eq(false)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested room" do
      expect {
        delete :destroy, {:id => room.to_param}, valid_session
      }.to change(Room, :count).by(-1)
    end

    it "redirects to the rooms list" do
      delete :destroy, {:id => room.to_param}, valid_session
      expect(response).to redirect_to(rooms_url)
    end
  end

end
