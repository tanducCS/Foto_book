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
require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
