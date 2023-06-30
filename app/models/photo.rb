# == Schema Information
#
# Table name: photos
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#  image_url    :string           not null
#  sharing_mode :integer          default("public1"), not null
#
class Photo < ApplicationRecord
  enum :sharing_mode, [:public1, :private1]
  belongs_to :user, foreign_key: "user_id"

  has_many :photo_belong_to_albums
  has_many :albums, through: :photo_belong_to_albums



  validates :title, length: {maximum: 140}
  validates :description, length: {maximum: 300}

  validates :image_url, format: { with: /\.(png|jpg|gif)\z/i, message: "must be a valid image URL" }
  # image size validate
  validates :title, :sharing_mode, :description, :user_id, :image_url, presence: true
end
