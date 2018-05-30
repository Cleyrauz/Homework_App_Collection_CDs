require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

    def save()
    sql = "INSERT INTO albums
    (
      title,
      genre,
      artist_id
    ) VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def all()
    sql = "SELECT * FROM albums"
    all_albums = SqlRunner.run(sql)
    return all_albums.map { |album| Album.new(album) }
  end

  def self.delete_all()
   sql = "DELETE FROM albums"
   SqlRunner.run(sql)
   end

   def find_albums_by_artist(artist)
     sql = "SELECT * FROM albums WHERE artist_id = $1"
     values = [artist.id]
     results = SqlRunner.run(sql, values)
     return results.map{|album| Album.new(album)}
   end

  def update()
     sql = "UPDATE albums SET title = $1 WHERE id = $2"
     values = [@title, @id]
     SqlRunner.run(sql, values)
   end

 def delete()
   sql = "DELETE FROM albums where id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
 end

 def find_album_by_id(id)
  sql = "SELECT * FROM albums WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return results.map{|album| Album.new(album)}
end


end
