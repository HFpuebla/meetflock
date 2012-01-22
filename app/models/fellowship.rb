class Fellowship < ActiveRecord::Base
  STATUS = {:not_working => 0, :working => 1, :pending => 3, :rejected => 4}
  
  # Associations
  belongs_to :user
  belongs_to :coworker, :class_name => 'User'
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

