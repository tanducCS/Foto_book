# == Schema Information
#
# Table name: albums
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#  sharing_mode :integer          default(0), not null
#
class Album < ApplicationRecord
  belongs_to :user, counter_cache: true, foreign_key: "user_id"

  has_many :photo_belong_to_albums
  validates :title, length: {maximum: 140}
  validates :description, length: {maximum: 300}
  validates :sharing_mode, inclusion: [public,private]
  has_many :photos, through: :photo_belong_to_albums

  validates :title, :sharing_mode, :description, :user_id, presence: true

end
