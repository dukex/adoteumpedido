require 'spec_helper'

describe RequestsController do
  describe "GET index" do
    it "should assigns requests" do
      requests = 5.times.map{ create :request }
      get :index
      assigns(:requests).should == requests.reverse
    end
  end

  describe "GET show" do
    it "should assigns request" do
      request = create :request
      get :show, id: request.id
      assigns(:request).should == request
    end
  end

  describe "GET new" do
    it "should assigns new request" do
      get :new
      assigns(:request).should be_instance_of(Request)
    end
  end

  describe "POST create" do
    it "should create a request with params" do
      post :create, request: {description: "Ola Mundo"}
      Request.last.description.should == "Ola Mundo"
    end

    it "should redirect to request path" do
      post :create, request: {description: "Ola Mundo"}
      response.should redirect_to(request_path(Request.last))
    end
  end

  %w(edit update destroy).each do |action|
    it "should not respond to #{action}" do
      subject.should_not respond_to(action)
    end
  end
end