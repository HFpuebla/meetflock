class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_mailbox

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  has_one :profile
  has_and_belongs_to_many :roles
  has_many :coworker_requests
  has_many :fellowships, :foreign_key => "inviter_id"
  has_many :coworkers, :through => :fellowships, :foreign_key => "invited_id"
  has_many :inverse_coworkers, :through => :fellowships, :foreign_key => "inviter_id"

  # Validations
  validates :username, :uniqueness => true

  def role?(role)
    !!self.roles.find_by_name(role.to_s)
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end

# Setting facebook log in functionality
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else
      # Create a user with a stub password.
      user = User.create!(:username => data.username ? data.username : data.nickname , :email => data.email, :password => Devise.friendly_token[0,20])
    end
  end

end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  motto                  :text
#  website                :string(255)
#  status                 :string(255)
#  receive_newsletter     :boolean
#  location_id            :integer
#  city_id                :integer
#  username               :string(255)
#

