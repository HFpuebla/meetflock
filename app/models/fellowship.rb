class Fellowship < ActiveRecord::Base
  #Scopes
  scope :between_users, lambda { |visitor, visited| where("inviter_id = #{visitor.id} and invited_id = #{visited.id} 
                                                           or inviter_id = #{visited.id} and invited_id = #{visitor.id}")  }
  
  # Constants
  STATUSES = {:pending => 0, 
              :working => 1, 
              :rejected => 2,
              :worked => 3}
  
  # Associations
  belongs_to :inviter, :class_name => "User", :foreign_key => "inviter_id"
  belongs_to :invited, :class_name => 'User', :foreign_key => "invited_id"
  
  
  # Instance Methods
  STATUSES.each do |k, v|
    define_method "#{k.to_s}?" do
      status == STATUSES[k]
    end
  end
  
  def update_status(new_status, requested_by)
    if self.worked? and requested_by.id == invited_id
      self.invited_id = self.inviter_id
      self.inviter_id = requested_by.id
      self.status = new_status
      self.save
    else
      self.status = new_status
      self.save
    end
  end
end

# == Schema Information
#
# Table name: fellowships
#
#  id         :integer         not null, primary key
#  inviter_id :integer
#  invited_id :integer
#  status     :integer
#  created_at :datetime
#  updated_at :datetime
#

