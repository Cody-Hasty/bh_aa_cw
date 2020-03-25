# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  title          :string
#  year           :integer
#  live_recording :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  band_id        :integer
#
require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
