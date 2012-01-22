class Profile < ActiveRecord::Base
  # Constants
  STATUS = {:available => 0, :not_available => 1}
  
  # Gem Configs
  acts_as_taggable
  acts_as_taggable_on :skills
  metropoli_for :city
  
  # Associations
  belongs_to :user
  belongs_to :position
  
  has_attached_file :avatar, 
    :styles => { :mini => '48x48>', :small => '100x100>', :product => '240x240>', :large => '600x600>' },
    :default_style => :product,
    :url => "/assets/avatars/:id/:style/:basename.:extension",
    :path => ":rails_root/app/assets/avatars/:id/:style/:basename.:extension",
    :storage => Rails.env == 'production' ? 's3' : 'filesystem',
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    },
    :bucket => ENV['S3_BUCKET']
    
  # Hooks
  after_save :expire_profile_all_cache
  after_destroy :expire_profile_all_cache
    
  # Validations
  validates :name, :city_name, :motto, :position,  :presence => true
  validates :status, :inclusion => { :in => STATUS.collect { |k, v| v.to_s } }
  validates :skill_list, :length => { :minimum => 1, :maximum => 5 }
  validate :no_attachement_errors
  
  # if there are errors from the plugin, then add a more meaningful message
  def no_attachement_errors
    unless avatar.errors.empty?
      # uncomment this to get rid of the less-than-useful interrim messages
      # errors.clear 
      errors.add :avatar, "Paperclip returned errors for file '#{avatar_file_name}' - check ImageMagick installation or image source file."
      false
    end
  end
  
  def self.all_cached
    Rails.cache.fetch('Profile.all') { order('created_at DESC') }
  end
  
  def expire_profile_all_cache
    Rails.cache.delete('Profile.all')
  end
  
end
# == Schema Information
#
# Table name: profiles
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  motto               :text
#  website             :string(255)
#  status              :string(255)
#  receive_newsletter  :boolean
#  published           :boolean
#  position_id         :integer
#  user_id             :integer
#  created_at          :datetime
#  updated_at          :datetime
#  city_id             :integer
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

