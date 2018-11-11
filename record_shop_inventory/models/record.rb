require_relative( '../db/sql_runner' )
require_relative('label')
require('pry-byebug')

class Record

  attr_accessor :title

  attr_reader :id, :artist, :genre, :description, :label_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist = options['artist']
    @genre = options['genre']
    @description = options['description']
    @stock_quantity = options['stock_quantity'].to_i
    @buying_cost = options['buying_cost'].to_i
    @selling_price = options['selling_price'].to_i
    @label_id = options['label_id'].to_i
  end

  def provide_stock_quantity
    return @stock_quantity
  end

  def provide_buying_cost
    return @buying_cost
  end

  def provide_selling_price
    return @selling_price
  end

  def self.all(sort = nil)
    if sort == nil
      sql = "SELECT * FROM records"
    elsif sort == 'title a-z'
      sql = "SELECT * FROM records ORDER BY UPPER(title) ASC"
    end
    Record.map(SqlRunner.run(sql))
  end

  def record
    sql = "SELECT * FROM records WHERE id = $1"
    values = [@id]
    Record.map(SqlRunner.run(sql, values))
  end

  def save
    sql = "INSERT INTO records (title, artist, genre, description, stock_quantity, buying_cost, selling_price, label_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id"
    values = [@title, @artist, @genre, @description, @stock_quantity, @buying_cost, @selling_price, @label_id]
    record = SqlRunner.run(sql, values).first;
    @id = record['id'].to_i
  end

  def update
    sql = "UPDATE records SET (title, artist, genre, description, stock_quantity, buying_cost, selling_price, label_id) = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id = $9"
    values = [@title, @artist, @genre, @description, @stock_quantity, @buying_cost, @selling_price, @label_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM records WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM records"
    SqlRunner.run(sql)
  end

  def self.map(item_to_map)
    return item_to_map.map{|item| Record.new(item)}
  end

  def markup
    return @selling_price - @buying_cost
  end

  def label
    sql = "SELECT * FROM labels WHERE id = $1"
    values = [@label_id]
    Label.map(SqlRunner.run(sql, values))
  end

  def reduce_stock(number)
    if @stock_quantity > number
      @stock_quantity -= number
      update
    else
      return false
    end
  end

  def self.record(id)
    sql = "SELECT * FROM records WHERE id = $1"
    values = [id]
    Record.map(SqlRunner.run(sql, values))
  end

end
