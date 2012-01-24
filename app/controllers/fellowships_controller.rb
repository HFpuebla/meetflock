class FellowshipsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @fellowship = current_user.fellowships.build(:invited_id => params[:invited_id], :status => Fellowship::STATUSES[:pending])
    @fellowship.save
    respond_to do |format|
      format.js
    end
  end
  
  def update
    @fellowship = Fellowship.find(params[:id])
    @fellowship.update_attributes(params[:fellowship])
    @visited = User.find(@fellowship.invited_id)
    respond_to do |format|
      format.js
    end
  end
end