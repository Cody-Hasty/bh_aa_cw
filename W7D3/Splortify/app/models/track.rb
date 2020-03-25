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
class Track < ApplicationRecord
    belongs_to :album,
        foreign_key: :album_id,
        class_name: :Album

    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band
end
