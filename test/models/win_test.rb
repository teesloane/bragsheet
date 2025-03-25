# == Schema Information
#
# Table name: wins
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  impact           :text
#  achievement_date :date
#  private_notes    :text
#  user_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_wins_on_user_id  (user_id)
#

require "test_helper"

class WinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
