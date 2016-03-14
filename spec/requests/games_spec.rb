require 'rails_helper'

describe "games", type: :request do
  let(:game_params) { { game: { title: 'Game' } } }
  let(:game_params2) { { game: { title: 'Game2' } } }
  let(:bad_game_params) { { game: { title: '' } } }
  let(:character_params) { { character: { name: 'Bob' } } }
  let(:move_params) { { move: { name: 'Fireball', input: 'QCF+P' } } }
  let(:user) { FactoryGirl.create(:user) }
  let(:user_params) { { email: user.email, password: user.password } }

  describe "games index page" do
    it "should render the games index page" do
      get "/games"
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
  end

  describe "games about page" do
    it "should render the games about page" do
      get "/games/about"
      expect(response).to have_http_status(200)
      expect(response).to render_template('about')
    end
  end

  describe "games help page" do
    it "should render the games help page" do
      get "/games/help"
      expect(response).to have_http_status(200)
      expect(response).to render_template('help')
    end
  end

  context "when logged in" do
    before do
      post '/log_in', user_params
      expect(response).to have_http_status(302)
    end

    describe 'Get /games/new' do
      it "should render the games new page" do
        get "/games/new"
        expect(response).to have_http_status(200)
        expect(response).to render_template('new')
      end
    end

    describe 'Post create /games' do
      it "should create a new game and redirect to index" do
        expect{
          post "/games", game_params
        }.to change(Game, :count).by(1)
        expect(response).to redirect_to '/games'
      end

      it "should not create a new game with bad params" do
        post "/games", bad_game_params
        expect(response).to render_template('new')
      end
    end

    describe 'Edit /game/1' do
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
        expect(response).to redirect_to '/games'
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
        post "/games/1/characters", character_params
        post "/games/1/characters", character_params
        post "/characters/1/moves", move_params
        post "/characters/1/moves", move_params
      end

      it "should destroy a game" do
        expect{
          delete "/games/1"
        }.to change(Game, :count).by(-1)
        expect(response).to redirect_to games_path
      end

      it "should destroy a game and associated characters" do
        expect{
          delete "/games/1"
        }.to change(Character, :count).by(-2)
        expect(response).to redirect_to games_path
      end

      it "should destroy a game and associated character's moves" do
        expect{
          delete "/games/1"
        }.to change(Move, :count).by(-2)
        expect(response).to redirect_to games_path
      end
    end
  end
end