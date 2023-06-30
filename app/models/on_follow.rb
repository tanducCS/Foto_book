# == Schema Information
#
# Table name: on_follows
#
#  id          :bigint           not null, primary key
#  follower_id :bigint
#  followee_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class OnFollow < ApplicationRecord
end
