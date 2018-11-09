require_relative( '../db/sql_runner' )
require('pry-byebug')

class Label

  attr_reader :id, :name, :location

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @location = options['location']
  end

  def save
    binding.pry
    sql = "INSERT INTO labels (name, location) VALUES ($1, $2) RETURNING id"
    values = [@name, @location]
    label = SqlRunner.run(sql, values).first;
    @id = label['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM labels"
    Label.map(SqlRunner.run(sql))
  end

  def self.map(item_to_map)
    return item_to_map.map{|item| Label.new(item)}
  end

end
