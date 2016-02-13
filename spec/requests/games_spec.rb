require 'rails_helper'

describe "games", type: :request do
  let(:game) { FactoryGirl.create(:game) }
  let(:game_params) { { game: {title: 'Game'} } }
  let(:game_params2) { { game: {title: 'Game2'} } }
  let(:bad_game_params) { { game: {title: ''} } }
  let(:user) { FactoryGirl.create(:user) }
  let(:user_params) { { email: user.email, password: user.password } }

  describe "games index page" do
    it "should render the games index page" do
      get "/games"
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
  end

  context "when logged in" do
    before do
      post '/log_in', user_params
      expect(response).to have_http_status(302)
    end

    describe 'GET /games/new' do
      it "should render the games new page" do
        get "/games/new"
        expect(response).to have_http_status(200)
        expect(response).to render_template('new')
      end
    end

    describe 'Post create /games' do
      it "should create a new game and redirect to show game" do
        expect{
          post "/games", game_params
        }.to change(Game, :count).by(1)
        expect(response).to redirect_to '/games/1'
      end

      it "should not create a new game with bad params" do
        post "/games", bad_game_params
        expect(response).to render_template('new')
      end
    end

    describe 'Show game' do
      it "should show game" do
        post "/games", game_params
        post "/games", game_params
        get "/games/2"
        expect(response).to have_http_status(200)
      end
    end

    describe 'EDIT /game/1' do
      it "should render edit page" do
        post "/games", game_params
        get "/games/1/edit"
        expect(response).to have_http_status(200)
      end
    end

    describe 'Update /game/1' do
      before(:each) { post "/games", game_params }

      it "should update game" do
        patch "/games/1", game_params2
        expect(response).to redirect_to '/games/1'
      end

      it "should not update with bad params" do
        patch "/games/1", bad_game_params
        expect(response).to render_template 'edit'
      end
    end

    describe 'Destroy /game/1' do
      before(:each) do
        post "/games", game_params
        post "/games", game_params2
      end

      it "should destroy a game" do
        expect{
          delete "/games/2"
        }.to change(Game, :count).by(-1)
        expect(response).to redirect_to games_path
      end
    end

  end
end