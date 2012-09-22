require 'spec_helper'

describe CommentsController do
  let(:request) { create(:request) }

  describe "POST create" do
    it "should create a comment with params" do
      post :create, comment: {body: "Ola Mundo"}, request_id: request.id
      Comment.last.body.should == "Ola Mundo"
    end

    it "should redirect to request path" do
      post :create, comment: {body: "Ola Mundo"}, request_id: request.id
      response.should redirect_to(request_path(request))
    end
  end

  %w(edit update destroy new index).each do |action|
    it "should not respond to #{action}" do
      subject.should_not respond_to(action)
    end
  end
end