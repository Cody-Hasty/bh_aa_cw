# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(username: "JackJohnston")
user2 = User.create!(username: "SqiggMcGee")
user3 = User.create!(username: "EatSleepCodeRepeat")

artwork1 = Artwork.create!(title: "TheGreatWar", image_url: "www.makesomethingup.com", artist_id: user1.id)
artwork2 = Artwork.create!(title: "FuzzyFriends", image_url: "www.makesomethingup.com", artist_id: user1.id)
artwork3 = Artwork.create!(title: "StickFigures", image_url: "www.makesomethingup.com", artist_id: user2.id)

share1 = ArtworkShare.create!(viewer_id: user2.id, artwork_id: artwork1.id)
share2 = ArtworkShare.create!(viewer_id: user3.id, artwork_id: artwork2.id)
share3 = ArtworkShare.create!(viewer_id: user1.id, artwork_id: artwork3.id)