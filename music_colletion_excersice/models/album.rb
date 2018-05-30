require('pg')
require_relative('../db/sql_runner')
require_relative('../artist')

class Album

  attr_accessor :title, :genre
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

  def self.all()
    sql = "SELECT * FROM albums"
    all_albums = SqlRunner.run(sql)
    return all_albums.map { |album| Album.new(album) }
  end

  def self.delete_all()
   sql = "DELETE FROM albums"
   SqlRunner.run(sql)
   end

  def update()
     sql = "UPDATE albums SET title WHERE id = $2"
     values = [@title, values]
     SqlRunner.run(sql, values)
   end

 def delete()
   sql = "DELETE FROM albums where id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
 end

#  def artist()
#   sql = "SELECT * FROM artists WHERE id = $2"
#   values = [@artist_id]
#   results = SqlRunner.run(sql, values)
#   return results.map{|artist| Astist.new(artist)}
# end


end
