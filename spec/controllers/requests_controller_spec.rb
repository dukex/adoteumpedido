require 'rails_helper'

RSpec.describe RequestsController do
  before do
    sign_in create(:user)
  end

  describe "GET index" do
    it "should assigns requests" do
      requests = 5.times.map{ create :request }
      get :index
      expect(assigns(:requests)).to eq(requests.reverse)
    end
  end

  describe "GET show" do
    it "should assigns request" do
      request = create :request
      get :show, id: request.id
      expect(assigns(:request)).to eq(request)
    end
  end

  describe "GET new" do
    it "should assigns new request" do
      get :new
      expect(assigns(:request)).to be_instance_of(Request)
    end
  end

  describe "POST create" do
    it "should create a request with params" do
      post :create, request: {description: "Ola Mundo", resume: "Ola",  authority_id: create(:authority).id}
      expect(Request.last.description).to eq("Ola Mundo")
    end

    it "should redirect to request path" do
      post :create, request: {description: "Ola Mundo", resume: "Ola",  authority_id: create(:authority).id}
      expect(response).to redirect_to(request_path(Request.last))
    end
  end

  %w(edit update destroy).each do |action|
    it "should not respond to #{action}" do
      expect(subject).to_not respond_to(action)
    end
  end
end
