class FellowshipsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @fellowship = current_user.fellowships.build(:corworker_id => params[:corworker_id], :status => Fellowship::STATUS[:pending])
    @fellowship.save
    respond_to do |format|
      format.js
    end
  end
  
  def update
    @fellowship = Fellowship.find(params[:id])
    @fellowship.update_attributes(params[:fellowship])
    respond_to do |format|
      format.js
    end
  end
end