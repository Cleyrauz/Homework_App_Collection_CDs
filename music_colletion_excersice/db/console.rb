#require("pry")
require_relative('../models/artist')
require_relative('../models/album')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => "Michael Jackson"})
artist1.save_artist()

artist2 = Artist.new({'name' => "The Beatles"})
artist2.save_artist()

album1 = Album.new({
  'title' => 'Thriller',
  'genre' => 'pop',
  'artist_id' => artist1.id
  })

album1.save()

album2 = Album.new({
  'title' => 'Sgt. Peppers',
  'genre' => 'rock',
  'artist_id' => artist2.id
  })

  album2.save()
p "All my artists are: "
p artist1.all()

p "All my albums are: "
p album1.all()

p "The album of artist id #{artist1.id}"
p album1.find_albums_by_artist(artist1)

p "The artist of album id #{album1.artist_id}"
p artist1.find_artist_by_album(album1)

artist1.name = "Janet Jackson"
artist1.update

album1.title  = "Dangerous"
album1.update

p "find artist by #{artist1.id}"
p artist2.find_artist_by_id(artist1.id)

p "find album by #{album1.id}"
p album2.find_album_by_id(album1.id)

album1.delete
artist1.delete



# binding.pry
# nil
