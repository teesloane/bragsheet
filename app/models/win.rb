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

class Win < ApplicationRecord
  belongs_to :user
end
