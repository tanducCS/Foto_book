# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  email      :string           not null
#  gender     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  last_login :datetime
#  active     :boolean          default(TRUE), not null
#  password   :string           not null
#  admin_id   :bigint
#
class User < ApplicationRecord
  has_many :normal_user, class_name: "User", foreign_key: "admin_id"
  belongs_to :admin_user, class_name: "User", optional: true

  has_many :albums
  has_many :photos


  validates :first_name, :last_name, :email, :active, :password, :gender , presence: true
  validates :first_name, length: {maximum: 25}
  validates :last_name, length: {maximum: 25}
  validates :email, length: {maximum: 255}
  validates :password, length: {maximum: 64}
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
