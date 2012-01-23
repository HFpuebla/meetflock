class Fellowship < ActiveRecord::Base
  STATUS = {:pending => "pending", 
            :working => "working", 
            :rejected => "rejected", 
            :worked => "worked"}
  
  # Associations
  belongs_to :inviter, :class_name => "User"
  belongs_to :invited, :class_name => "User"
end

# == Schema Information
#
# Table name: fellowships
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  coworker_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

