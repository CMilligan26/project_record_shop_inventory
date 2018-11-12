class Artist

  attr_accessor :artist_name

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @artist_name = options['artist_name']
  end

  def self.all
    sql = "SELECT * FROM artists"
    Artist.map(SqlRunner.run(sql))
  end

  def self.artist(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    Artist.map(SqlRunner.run(sql, values))
  end

  def save
    sql = "INSERT INTO artists (artist_name) VALUES ($1) RETURNING id"
    values = [@artist_name]
    artist = SqlRunner.run(sql, values).first;
    @id = artist['id'].to_i
  end

  def update
    sql = "UPDATE artists SET (artist_name) = ($1) WHERE id = $2"
    values = [@artist_name]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.map(item_to_map)
    return item_to_map.map{|item| Artist.new(item)}
  end

end
