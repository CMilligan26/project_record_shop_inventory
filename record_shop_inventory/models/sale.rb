require_relative( '../db/sql_runner' )
require_relative('record')
require('pry-byebug')

class Sale

  attr_accessor :sale_quantity

  attr_reader :id, :record_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @record_id = options['record_id'].to_i
    @sale_quantity = options['sale_quantity'].to_i
  end

  def provide_record_id
    return @record_id
  end

  def provide_sale_quantity
    return @sale_quantity
  end

  def self.all
    sql = "SELECT * FROM sales"
    Sale.map(SqlRunner.run(sql))
  end

  def sale
    sql = "SELECT * FROM sales WHERE id = $1"
    values = [@id]
    Sale.map(SqlRunner.run(sql, values))
  end

  def save
    sql = "INSERT INTO sales (record_id, sale_quantity) VALUES ($1, $2) RETURNING id"
    values = [@record_id, @sale_quantity]
    sale = SqlRunner.run(sql, values).first;
    @id = sale['id'].to_i
  end

  def update
    sql = "UPDATE sales SET (record_id, sale_quantity) = ($1, $2) WHERE id = $3"
    values = [@record_id, @sale_quantity, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM sales WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM sales"
    SqlRunner.run(sql)
  end

  def self.map(item_to_map)
    return item_to_map.map{|item| Sale.new(item)}
  end

  def record_buying_cost
    sale_buying_cost = (get_record_info.first.provide_buying_cost * @sale_quantity)
    return sale_buying_cost
  end

  def record_selling_price
    sale_selling_price = (get_record_info.first.provide_selling_price * @sale_quantity)
    return sale_selling_price
  end

  def record_markup
    sale_markup = (get_record_info.first.markup * @sale_quantity)
    return sale_markup
  end

  def record_profit
    overhead = 0.5
    return (record_markup*overhead).to_i
  end

  def get_record_info
    sql = "SELECT *
    FROM records
    INNER JOIN sales
    ON records.id = sales.record_id
    WHERE records.id = $1"
    values = [@record_id]
    record = Record.map(SqlRunner.run(sql, values))
    return record
  end

  def self.total_record_buying_cost
    sales = Sale.all
    total_buying_cost = 0
    sales.each{|sale| total_buying_cost += sale.record_buying_cost}
    return total_buying_cost
  end

  def self.total_record_selling_price
    sales = Sale.all
    total_selling_price = 0
    sales.each{|sale| total_selling_price += sale.record_selling_price}
    return total_selling_price
  end

  def self.total_record_mark_up
    sales = Sale.all
    total_markup = 0
    sales.each{|sale| total_markup += sale.record_markup}
    return total_markup
  end

  def self.total_profit
    sales = Sale.all
    total_profit = 0
    sales.each{|sale| total_profit += sale.record_profit}
    return total_profit
  end

end
