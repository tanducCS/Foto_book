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
require "test_helper"

class OnFollowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
