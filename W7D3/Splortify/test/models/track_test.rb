# == Schema Information
#
# Table name: tracks
#
#  id           :integer          not null, primary key
#  title        :string
#  ord          :integer
#  lyrics       :string
#  bounus_track :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  album_id     :integer
#  band_id      :integer
#
require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
