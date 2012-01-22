class Position < ActiveRecord::Base
  has_many :profiles
  has_many :coworker_requests 
  
  after_save :expire_position_all_cache
  after_destroy :expire_position_all_cache
  
  scope :with_profiles, joins(:profiles).select("DISTINCT  positions.id, positions.name")
  
  def self.all_cached
    Rails.cache.fetch("Position.all") { all }
  end
  
  def expire_position_all_cache
    Rails.cache.delete('Position.all')
  end
end
# == Schema Information
#
# Table name: positions
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

