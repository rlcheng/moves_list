require 'rails_helper'

describe "moves", type: :request do
  let(:move_params) { { move: { name: 'Fireball', input: 'QCF+P' } } }
  let(:move_params2) { { move: { name: 'Dragon Punch', input: 'FDDF+P' } } }
  let(:bad_move_params) { { move: { name: '', input: '' } } }
  let(:character_params) { { character: { name: 'Dan' } } }
  let(:game_params) { { game: { title: 'Game' } } }
  let(:user) { FactoryGirl.create(:user) }
  let(:user_params) { { email: user.email, password: user.password } }  

  context "when logged in" do
    before do
      post '/log_in', user_params
      expect(response).to have_http_status(302)
      post "/games", game_params
      expect(response).to redirect_to '/games'
      post "/games/1/characters", character_params
      expect(response).to redirect_to '/games/1/characters'
    end

    describe "Post create move" do
      it "should create a move and refresh page" do
        expect{
          post "/characters/1/moves", move_params
        }.to change(Move, :count).by(1)
        expect(response).to redirect_to '/characters/1/moves'
      end      
    end

    describe "moves index page" do
      it "should render the games index page" do
        get "/characters/1/moves"
        expect(response).to have_http_status(200)
        expect(response).to render_template('index')
      end
    end

    describe 'Edit move' do
      it "should render edit page for character's move in game" do
        post "/characters/1/moves", move_params
        get "/moves/1/edit"
        expect(response).to have_http_status(200)
      end
    end

    describe 'Update move' do
      before(:each) { post "/characters/1/moves", move_params }
      
      it "should update character's move in game" do
        patch "/moves/1", move_params2
        expect(response).to redirect_to '/characters/1/moves'        
      end

      it "should not update with bad params" do
        patch "/moves/1", bad_move_params
        expect(response).to render_template 'edit'
      end      
    end

    describe 'Delete move' do
      before(:each) do
        post "/characters/1/moves", move_params
        post "/characters/1/moves", move_params2
      end

      it "should destroy a move" do
        expect{
          delete "/moves/2"
        }.to change(Move, :count).by(-1)
        expect(response).to redirect_to '/characters/1/moves'
      end            
    end
  end
end