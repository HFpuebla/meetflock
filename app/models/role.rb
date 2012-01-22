class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  after_save :expire_role_all_cache
  after_destroy :expire_role_all_cache
  
  def self.all_cached
    Rails.cache.fetch("Role.all") { all }
  end
  
  def expire_position_all_cache
    Rails.cache.delete('Role.all')
  end
end
# == Schema Information
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

