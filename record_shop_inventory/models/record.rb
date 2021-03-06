require_relative( '../db/sql_runner' )
require_relative('label')
require_relative('artist')
require_relative('genre')

class Record

  attr_accessor :title, :file

  attr_reader :id, :artist_id, :release_date, :label_id, :sold, :running_stock_total, :total_sold, :file

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist_id = options['artist_id'].to_i
    @release_date = options['release_date']
    @stock_quantity = options['stock_quantity'].to_i
    @buying_cost = options['buying_cost'].to_f.round(2)
    @selling_price = options['selling_price'].to_f.round(2)
    @label_id = options['label_id'].to_i
    if options['running_stock_total']
      @running_stock_total = options['running_stock_total'].to_i
    else
      @running_stock_total = @stock_quantity.clone
    end
    if options['total_sold']
      @total_sold = options['total_sold'].to_i
    else
      @total_sold = 0
    end
    if options['file']
      @file = options['file']
    else
      @file = ""
    end
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

  def provide_file
    return @file
  end

  def self.all(sort = nil)
    if sort == nil
      sql = "SELECT * FROM records"
    elsif sort == 'title a-z'
      sql = "SELECT * FROM records ORDER BY UPPER(title) ASC"
    elsif sort == 'title z-a'
      sql = "SELECT * FROM records ORDER BY UPPER(title) DESC"
    elsif sort == 'artist a-z'
      sql = "SELECT records.*
      FROM records
      INNER JOIN artists
      ON records.artist_id = artists.id
      ORDER BY UPPER(artists.artist_name) ASC"
    elsif sort == 'artist z-a'
      sql = "SELECT records.*
      FROM records
      INNER JOIN artists
      ON records.artist_id = artists.id
      ORDER BY UPPER(artists.artist_name) DESC"
    elsif sort == 'release_date first-last'
      sql = "SELECT * FROM records ORDER BY release_date ASC"
    elsif sort == 'release_date last-first'
      sql = "SELECT * FROM records ORDER BY release_date DESC"
    elsif sort == 'label a-z'
      sql = "SELECT records.*
      FROM records
      INNER JOIN labels
      ON records.label_id = labels.id
      ORDER BY UPPER(labels.name) ASC"
    elsif sort == 'label z-a'
      sql = "SELECT records.*
      FROM records
      INNER JOIN labels
      ON records.label_id = labels.id
      ORDER BY UPPER(labels.name) DESC"
    elsif sort == 'stock_quantity lowest-highest'
      sql = "SELECT * FROM records ORDER BY stock_quantity ASC"
    elsif sort == 'stock_quantity highest-lowest'
      sql = "SELECT * FROM records ORDER BY stock_quantity DESC"
    else
      sql = "SELECT records.*
      FROM records
      WHERE UPPER(title) LIKE '%#{sort.upcase}%'"
    end
    Record.map(SqlRunner.run(sql))
  end

  def record
    sql = "SELECT * FROM records WHERE id = $1"
    values = [@id]
    Record.map(SqlRunner.run(sql, values))
  end

  def save
    sql = "INSERT INTO records (title, artist_id, release_date, running_stock_total, stock_quantity, total_sold, buying_cost, selling_price, label_id, file) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING id"
    values = [@title, @artist_id, @release_date, @running_stock_total, @stock_quantity, @total_sold, @buying_cost, @selling_price, @label_id, @file]
    record = SqlRunner.run(sql, values).first;
    @id = record['id'].to_i
  end

  def update
    sql = "UPDATE records SET (title, artist_id, release_date, stock_quantity, buying_cost, selling_price, label_id, file) = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id = $9"
    values = [@title, @artist_id, @release_date, @stock_quantity, @buying_cost, @selling_price, @label_id, @file, @id]
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
    markup = @selling_price - @buying_cost
    return markup.round(2)
  end

  def label
    sql = "SELECT * FROM labels WHERE id = $1"
    values = [@label_id]
    Label.map(SqlRunner.run(sql, values))
  end

  def calculate_stock
    sql = "SELECT sales.sale_quantity
    FROM sales
    INNER JOIN records
    ON sales.record_id = records.id
    WHERE records.id = $1"
    values = [@id]
    sales = SqlRunner.run(sql, values).map{|sale_quantity| sale_quantity}
    @total_sold = 0;
    sales.each{|sale| @total_sold += sale["sale_quantity"].to_i}
    @stock_quantity = @running_stock_total - @total_sold
    update_total_sold
    update
  end

  def self.record(id)
    sql = "SELECT * FROM records WHERE id = $1"
    values = [id]
    Record.map(SqlRunner.run(sql, values))
  end

  def update_total_sold
    sql = "UPDATE records SET total_sold = $1 WHERE id = $2"
    values = [@total_sold, @id]
    SqlRunner.run(sql, values)
  end

  def update_running_stock_total(number)
    @running_stock_total = record.first.running_stock_total + number
    sql = "UPDATE records SET running_stock_total = $1 WHERE id = $2"
    values = [@running_stock_total, @id]
    SqlRunner.run(sql, values)
    calculate_stock
  end

  def get_all_genres
    sql = "SELECT genres.*
    FROM genres
    INNER JOIN genre_categorizations
    ON genre_categorizations.genre_id = genres.id
    INNER JOIN records
    ON genre_categorizations.record_id = records.id
    WHERE records.id = $1"
    values = [@id]
    Genre.map(SqlRunner.run(sql, values))
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    Artist.map(SqlRunner.run(sql, values))
  end

end
