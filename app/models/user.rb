# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email_address   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email_address  (email_address) UNIQUE
#

class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  after_create :create_user_profile

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  private

  def create_user_profile
    build_user_profile.save
  end
end
