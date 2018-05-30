require("pry")
require_relative("../models/artist")
require_relative("../models/album")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => "Michael Jackson"})
artist1.save()

artist2 = Artist.new({'name' => "The Beatles"})
artist2.save()

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

artist1.name = "Janet Jackson"
artist1.update

album1.title  = "Dangerous"
album1.update

binding.pry
nil
