class ProfilesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  def index
    @search = Profile.search(params[:search])
    @profiles = @search.paginate(:page => params[:page], :per_page => 20) 
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @profiles }
    end
  end
  
  def show
    
  end
  
  # Shows the logged user profile
  def profile
    @profile = current_user.profile
    respond_to do |format|
      format.html
      format.json { render json: @profile }
    end
  end

  def edit_profile
    @profile = current_user.profile.nil? ? current_user.build_profile : current_user.profile
    respond_to do |format|
        if !params[:profile]
          format.html #edit_profile.html.erb
        elsif @profile.update_attributes(params[:profile])
          format.html { redirect_to profile_path, notice: 'Profile was successfully updated.' }
          format.json { head :ok }
        else
          format.html #edit_profile.html.erb
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
    end
  end
end
