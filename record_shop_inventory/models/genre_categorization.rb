class GenreCategorization

  attr_reader :id, :record_id, :genre_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @record_id = options['record_id'].to_i
    @genre_id = options['genre_id'].to_i
  end

  def self.all
    sql = "SELECT * FROM genre_categorizations"
    GenreCategorization.map(SqlRunner.run(sql))
  end

  def self.genre_categorization(id)
    sql = "SELECT * FROM genre_categorizations WHERE id = $1"
    values = [id]
    GenreCategorization.map(SqlRunner.run(sql, values))
  end

  def save
    sql = "INSERT INTO genre_categorizations (record_id, genre_id) VALUES ($1, $2) RETURNING id"
    values = [@record_id, @genre_id]
    genre_categorization = SqlRunner.run(sql, values).first;
    @id = genre_categorization['id'].to_i
  end

  def update
    sql = "UPDATE genre_categorizations SET (record_id, genre_id) = ($1, $2) WHERE id = $3"
    values = [@record_id, @genre_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM genre_categorizations WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM genre_categorizations"
    SqlRunner.run(sql)
  end

  def self.map(item_to_map)
    return item_to_map.map{|item| GenreCategorization.new(item)}
  end

end
