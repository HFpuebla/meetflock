require 'spec_helper'

describe Profile do
  pending "add some examples to (or delete) #{__FILE__}"
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

