require_relative('../db/sql_runner')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save_artist()
    sql = "INSERT INTO artists(name) VALUES($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

    def all()
      sql = "SELECT * FROM artists";
      artists = SqlRunner.run(sql)
      return artists.map{|person| Artist.new(person)}
    end

    def self.delete_all()
      sql = "DELETE FROM artists"
      SqlRunner.run(sql)
    end

    def find_artist_by_album(album)
      sql = "SELECT * FROM artists WHERE id = $1"
      values = [album.artist_id]
      results = SqlRunner.run(sql, values)
      return results.map{|person| Artist.new(person)}
    end

    def update()
      sql = "UPDATE artists SET name = $1 WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM artists WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def find_artist_by_id(id)
      sql = "SELECT * FROM artists WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql, values)
      return results.map{|person| Artist.new(person)}
    end




end
