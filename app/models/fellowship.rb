class Fellowship < ActiveRecord::Base
  # Constants
  STATUSES = {:pending => 0, 
            :working => 1, 
            :rejected => 2,
            :worked => 3}
  
  # Associations
  belongs_to :inviter, :class_name => "User" 
  belongs_to :invited, :class_name => 'User'
  
  
  # Instance Methods
  STATUSES.each do |k, v|
    define_method "#{k}?" do
      endself.status == STATUSES[k]
    end
  end
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

