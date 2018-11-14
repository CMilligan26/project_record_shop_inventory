class Genre

  attr_accessor :genre_name

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @genre_name = options['genre_name']
  end

  def self.all
    sql = "SELECT * FROM genres"
    Genre.map(SqlRunner.run(sql))
  end

  def self.genre(id)
    sql = "SELECT * FROM genres WHERE id = $1"
    values = [id]
    Genre.map(SqlRunner.run(sql, values))
  end

  def save
    sql = "INSERT INTO genres (genre_name) VALUES ($1) RETURNING id"
    values = [@genre_name]
    genre = SqlRunner.run(sql, values).first;
    @id = genre['id'].to_i
  end

  def update
    sql = "UPDATE genres SET genre_name = $1 WHERE id = $2"
    values = [@genre_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM genres WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM genres"
    SqlRunner.run(sql)
  end

  def self.map(item_to_map)
    return item_to_map.map{|item| Genre.new(item)}
  end

  def self.get_records(id)
    sql = "SELECT records.*
    FROM records
    INNER JOIN genre_categorizations
    ON records.id = genre_categorizations.record_id
    INNER JOIN genres
    ON genre_categorizations.genre_id = genres.id
    WHERE genres.id = $1"
    values = [id]
    Record.map(SqlRunner.run(sql, values))
  end

end
