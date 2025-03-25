# == Schema Information
#
# Table name: user_profiles
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  bio        :text
#  location   :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_profiles_on_user_id  (user_id)
#

require "test_helper"

class UserProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
