require 'rails_helper'

describe "user", type: :request do

  let!(:new_user) { FactoryGirl.build(:user) }
  let(:new_params) {{ user: { email: new_user.email,
    password: new_user.password, password_confirmation: new_user.password} } }
  let(:new_params2) {{ user: { email: new_user.email.upcase,
    password: new_user.password, password_confirmation: new_user.password} } }

  it "should render the sign up page" do
    get '/sign_up'
    expect(response.code).to eq("200")
  end

  it "should create a user" do
    post '/users', new_params
    expect(response.code).to eq("302")
    expect(response).to redirect_to(root_path)
    new_user_email = new_params[:user][:email]
    expect(User.where(email: new_user_email).first.email).to eq(new_user_email)
  end

  it "should not create a user with error" do
    post '/users', user: { email: "", password: "", password_confirmation: "" }
    expect(response).to render_template('new')
    expect(response.body).to include("Form is invalid")
    expect(response.body).to include("Password") #full message is Password can't be blank
    expect(response.body).to include("Email is invalid")
  end

  it "should not create user if new user's email is capitalized of existing" do
    post '/users', new_params
    expect(response.code).to eq("302")
    post '/users', new_params2
    expect(response).to render_template('new')
    expect(response.body).to include("Form is invalid")
    expect(response.body).to include("Email has already been taken")
  end
end
