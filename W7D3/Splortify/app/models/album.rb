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
class Album < ApplicationRecord
    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band

    has_many :tracks,
        foreign_key: :album_id,
        class_name: :Track
end
