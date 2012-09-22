require 'spec_helper'

describe AdoptsController do
  let(:request){ create(:request) }

  describe "GET show" do
    it "should assigns adopt" do
      adopt = create :adopt
      get :show, id: adopt.id, request_id: request.id
      assigns(:adopt).should == adopt
    end
  end

  describe "GET new" do
    it "should assigns new adopt" do
      get :new, request_id: request.id
      assigns(:adopt).should be_instance_of(Adopt)
    end

    it "should assigns the request" do
      get :new, request_id: request.id
      assigns(:request).should == request
    end

    it "should use request data" do
      get :new, request_id: request.id
      assigns(:adopt).description.should  == request.description
      assigns(:adopt).resume.should == request.resume
    end
  end

  describe "POST create" do
    it "should create a adopt with params" do
      post :create, request_id: request.id, adopt: {description: "Ola Mundo"}
      Adopt.last.description.should == "Ola Mundo"
    end

    it "should redirect to adopt path" do
      post :create, adopt: {description: "Ola Mundo"}, request_id: request.id
      response.should redirect_to(request_adopt_path(request, Adopt.last))
    end

    context "with a user" do
      let(:user){ create(:user) }

      before(:each) do
        sign_in user
      end

      it "should create to current user" do
        post :create, adopt: {description: "Ola Mundo"}, request_id: request.id
        Adopt.last.user.should == user
      end
    end
  end


  %w(edit update destroy index).each do |action|
    it "should not respond to #{action}" do
      subject.should_not respond_to(action)
    end
  end
end