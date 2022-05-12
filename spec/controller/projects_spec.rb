require "rails_helper"


RSpec.describe ProjectsController, type: :controller do
  describe 'new project' do
  it 'it redirects to login if not signed in' do
    get :new
    expect(response).to redirect_to(new_user_session_path)
  end

  it 'renders a successful response if signed in' do
    sign_in create(:user, email: 'johnDoe@gmail.com')
    get :new
    expect(response).to be_success
  end
end
  
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end
end