require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO atists(name) VALUES($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

    def self.all()
      sql = "SELECT* FROM artists";
      artists = SqlRunner.run(sql)
      return artists.map{|person| Artist.new(person)}
    end

    def self.delete_all()
      sql = "DELETE FROM artists"
      SqlRunner.run(sql)
    end


    def update()
      sql = "UPDATE artists SET name = $1 WHERE id = $1"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM artists WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    # def albums()
    #   sql = "SELECT * FROM albums WHERE artist_id = $2"
    #   values = [@id]
    #   results = SqlRunner.rin(sql, values)
    #   return results.map{|album| Album.new(album)}
    # end


end
