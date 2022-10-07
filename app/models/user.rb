# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address1               :string
#  city                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  state_code             :string
#  zipcode                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_one_attached :avatar
  has_many :articles, dependent: :destroy

  def name
    @name ||= self[:name].presence || email.split("@").first
  end

  protected

  def password_required?
    new_record? || password.present?
  end
end
