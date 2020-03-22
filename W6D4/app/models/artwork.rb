# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :title, uniqueness: {scope: :artist_id, message: "Each title can only be assigned once per artist."}
   
    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User
    
    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :Artwork

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer
        
end
