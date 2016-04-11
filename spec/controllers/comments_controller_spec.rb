require 'rails_helper'

RSpec.describe CommentsController do
  let(:request) { create(:request) }

  describe "POST create" do
    it "should create a comment with params" do
      post :create, comment: {body: "Ola Mundo"}, request_id: request.id
      expect(Comment.last.body).to eq("Ola Mundo")
    end

    it "should redirect to request path" do
      post :create, comment: {body: "Ola Mundo"}, request_id: request.id
      expect(response).to redirect_to(request_path(request))
    end

    it "should not save the comment if body is empty" do
      post :create, comment: {body: ""}, request_id: request.id
      expect(response).to redirect_to(request_path(request))
      expect(Comment.count).to eq(0)
    end
  end

  %w(edit update destroy new index).each do |action|
    it "should not respond to #{action}" do
      expect(subject).to_not respond_to(action)
    end
  end
end