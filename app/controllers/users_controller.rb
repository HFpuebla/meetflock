class UsersController < ApplicationController
  before_filter :find_model

  

  private
  def find_model
    @model = Users.find(params[:id]) if params[:id]
  end
end