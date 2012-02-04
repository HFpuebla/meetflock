class FellowshipsController < ApplicationController
  before_filter :authenticate_user!, :find_visited
  
  def create
    @fellowship = Fellowship.create!(:inviter_id => current_user.id, :invited_id => @visited.id, :status => Fellowship::STATUSES[:pending])
    @fellowship.save
    
    respond_to do |format|
      format.js
    end
  end
  
  def update
    @fellowship = Fellowship.find(params[:fellowship_id])
    @updated = @fellowship.update_status(params[:status], current_user)
    
    respond_to do |format|
      format.js
    end
  end
  
  private

  def find_visited
    @visited = User.find(params[:visited_id])
  end
end