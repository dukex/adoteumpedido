require 'rails_helper'

RSpec.describe AdoptsController do
  let(:request){ create(:request) }

  describe "GET show" do
    it "should assigns adopt" do
      adopt = create :adopt
      get :show, id: adopt.id, request_id: request.id
      expect(assigns(:adopt)).to eq(adopt)
    end
  end

  describe "GET new" do
    it "should assigns new adopt" do
      get :new, request_id: request.id
      expect(assigns(:adopt)).to be_instance_of(Adopt)
    end

    it "should assigns the request" do
      get :new, request_id: request.id
      expect(assigns(:request)).to eq(request)
    end

    it "should use request data" do
      get :new, request_id: request.id
      expect(assigns(:adopt).description).to  eq(request.description)
      expect(assigns(:adopt).resume).to eq(request.resume)
    end
  end

  describe "POST create" do
    it "should create a adopt with params" do
      post :create, request_id: request.id, adopt: {description: "Ola Mundo", resume: "Ola"}
      expect(Adopt.last.description).to eq("Ola Mundo")
    end

    it "should redirect to adopt path" do
      post :create, adopt: {description: "Ola Mundo", resume: "Ola"}, request_id: request.id
      expect(response).to redirect_to(request_adopt_path(request, Adopt.last))
    end

    it "should render new with a invalid adopt" do
      post :create, adopt: {description: nil, resume: nil}, request_id: request.id, format: :html
      expect(response).to render_template(:new)
    end
  end


  %w(edit update destroy index).each do |action|
    it "should not respond to #{action}" do
      expect(subject).to_not respond_to(action)
    end
  end
end
