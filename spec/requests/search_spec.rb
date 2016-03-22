require 'rails_helper'

describe "search", type: :request do
  describe 'Search for a game' do
    before(:each) do
      game = Game.create(title: "Street Fighter 2")
      game.__elasticsearch__.index_document
      Game.__elasticsearch__.refresh_index!
    end

    describe 'Get /search' do
      it "should render the search page" do
        get "/search"
        expect(response).to have_http_status(200)
        expect(response).to render_template('search')
      end

      it "should find a game", :elasticsearch do
        get "/search?utf8=%E2%9C%93&q=Street"
        expect(response).to have_http_status(200)
        expect(response).to render_template('search')
        expect(response.body).to include("Street")
      end

      it "should find a game with misspelling", :elasticsearch do
        get "/search?utf8=%E2%9C%93&q=Streeet"
        expect(response).to have_http_status(200)
        expect(response).to render_template('search')
        expect(response.body).to include("Street")
      end
    end
  end
end