module FellowshipsHelper
  # Checks if the give user has a relationship with a current logged user and returns the appropiate and status of the fellowship if it exists
  def fellowship_status_url(user)
    if @fellowship = Fellowship.exists?(:user_id => current_user.id, :coworker_id => user.id)
      
    else
    end
  end
end