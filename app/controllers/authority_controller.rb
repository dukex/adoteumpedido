class AuthorityController < ApplicationController
  def index
    @search = Authority.search name_contains: params[:query]
    render json: @search.all
  end
end
