require_relative( '../db/sql_runner' )
require('pry-byebug')

class Label

  attr_accessor :name

  attr_reader :id, :location

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @location = options['location']
  end

  def self.all
    sql = "SELECT * FROM labels"
    Label.map(SqlRunner.run(sql))
  end

  def self.label(id)
    sql = "SELECT * FROM labels WHERE id = $1"
    values = [id]
    Label.map(SqlRunner.run(sql, values))
  end

  def save
    sql = "INSERT INTO labels (name, location) VALUES ($1, $2) RETURNING id"
    values = [@name, @location]
    label = SqlRunner.run(sql, values).first;
    @id = label['id'].to_i
  end

  def update
    sql = "UPDATE labels SET (name, location) = ($1, $2) WHERE id = $3"
    values = [@name, @location, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM labels WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM labels"
    SqlRunner.run(sql)
  end

  def self.map(item_to_map)
    return item_to_map.map{|item| Label.new(item)}
  end

  def self.get_records(id)
    sql = "SELECT records.*
    FROM records
    WHERE label_id = $1"
    values = [id]
    Record.map(SqlRunner.run(sql, values))
  end

end
