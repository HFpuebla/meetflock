class CoworkerRequest < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :skills
  
  # Associations
  belongs_to :position
  belongs_to :user
  has_many :fellowships
  has_many :coworkers, :through => :fellowships 
  
  # Validations
  validates :position, :presence => true
  validates :skill_list, :length => { :minimum => 1, :maximum => 5 }
end
# == Schema Information
#
# Table name: coworker_requests
#
#  id          :integer         not null, primary key
#  position_id :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

