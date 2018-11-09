require_relative( '../db/sql_runner' )

class Record

  attr_reader :id, :title, :artist, :genre, :description, :label_id

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

end
