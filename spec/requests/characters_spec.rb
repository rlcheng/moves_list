require 'rails_helper'

describe "characters", type: :request do
  let(:character) { FactoryGirl.create(:character) }
  let(:character_params) { { character: { name: 'Bob' } } }
  let(:character_params2) { { character: { name: 'John' } } }
  let(:bad_character_params) { { character: { name: '' } } }
  let(:game) { FactoryGirl.create(:game) }
  let(:game_params) { { game: { title: 'Game' } } }
  let(:user) { FactoryGirl.create(:user) }
  let(:user_params) { { email: user.email, password: user.password } }  

  context "when logged in" do
    before do
      post '/log_in', user_params
      expect(response).to have_http_status(302)
      post "/games", game_params
      expect(response).to redirect_to '/games/1'
    end

    describe "Post create character" do
      it "should create a character and refresh page" do
        expect{
          post "/games/1/characters", character_params
        }.to change(Character, :count).by(1)
        expect(response).to redirect_to '/games/1'
      end      
    end

    describe 'Show character' do
      it "should show game" do
        post "/games/1/characters", character_params
        post "/games/1/characters", character_params
        get "/games/1/characters/2"
        expect(response).to have_http_status(200)
      end
    end

    describe 'Edit character' do
      it "should render edit page for character in game" do
        post "/games/1/characters", character_params
        get "/games/1/characters/1/edit"
        expect(response).to have_http_status(200)
      end
    end

    describe 'Update character' do
      before(:each) { post "/games/1/characters", character_params }
      
      it "should update character in game" do
        patch "/games/1/characters/1", character_params2
        expect(response).to redirect_to '/games/1'        
      end

      it "should not update with bad params" do
        patch "/games/1/characters/1", bad_character_params
        expect(response).to render_template 'edit'
      end      
    end

    describe 'Delete character' do
      before(:each) do
        post "/games/1/characters", character_params
        post "/games/1/characters", character_params2
      end

      it "should destroy a character" do
        expect{
          delete "/games/1/characters/2"
        }.to change(Character, :count).by(-1)
        expect(response).to redirect_to '/games/1'
      end            
    end
  end

end