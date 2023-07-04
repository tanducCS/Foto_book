# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string           not null
#  last_name              :string           not null
#  email                  :string           not null
#  gender                 :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  last_login             :datetime
#  active                 :boolean          default(TRUE), not null
#  password               :string           not null
#  admin_id               :bigint
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable



  has_many :albums, dependent: :destroy
  has_many :photos, dependent: :destroy


  validates :first_name, :last_name, :email, :active, :password, :gender , presence: true
  validates :first_name, length: {maximum: 25}
  validates :last_name, length: {maximum: 25}
  validates :email, length: {maximum: 255}
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP



end
