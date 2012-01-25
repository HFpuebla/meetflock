class Fellowship < ActiveRecord::Base
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

