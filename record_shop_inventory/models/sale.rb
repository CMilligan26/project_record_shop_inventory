require_relative( '../db/sql_runner' )
require_relative('record')

class Sale

  attr_accessor :sale_quantity

  attr_reader :id, :record_id, :overhead, :single_buying_cost, :single_selling_price, :single_markup, :single_profit, :total_buying_cost, :total_selling_price, :total_markup, :total_profit

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @record_id = options['record_id'].to_i
    @sale_quantity = options['sale_quantity'].to_i
    @overhead = options['overhead'].to_f
    #Comment out if using spec
    @single_buying_cost = get_record_info.first.provide_buying_cost
    @single_selling_price = get_record_info.first.provide_selling_price
    @single_markup = get_record_info.first.provide_selling_price - get_record_info.first.provide_buying_cost
    @single_profit = (get_record_info.first.provide_selling_price - get_record_info.first.provide_buying_cost) * @overhead
    @total_buying_cost = record_buying_cost
    @total_selling_price = record_selling_price
    @total_markup = record_markup
    @total_profit = record_profit
    #Comment out if using spec
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

  def self.all_sales_info
    sql = "SELECT * FROM sales"
    SqlRunner.run(sql).map{|hash| hash}
  end

  def self.sale(id)
    sql = "SELECT * FROM sales WHERE id = $1"
    values = [id]
    Sale.map(SqlRunner.run(sql, values))
  end

  def save
    if get_record_info.first.provide_stock_quantity >= @sale_quantity
      sql = "INSERT INTO sales (record_id, sale_quantity, overhead, single_buying_cost, single_selling_price, single_markup, single_profit, total_buying_cost, total_selling_price, total_markup, total_profit) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING id"
      values = [@record_id, @sale_quantity, @overhead, @single_buying_cost, @single_selling_price, @single_markup, @single_profit, @total_buying_cost, @total_selling_price, @total_markup, @total_profit]
      sale = SqlRunner.run(sql, values).first;
      @id = sale['id'].to_i
      get_record_info.first.calculate_stock
    else
      return false
    end
  end

  def update
    if get_record_info.first.provide_stock_quantity >= @sale_quantity
      sql = "UPDATE sales SET (record_id, sale_quantity, single_buying_cost, single_selling_price, single_markup, single_profit, total_buying_cost, total_selling_price, total_markup, total_profit) = ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) WHERE id = $11"
      values = [@record_id, @sale_quantity, @single_buying_cost, @single_selling_price, @single_markup, @single_profit, @total_buying_cost, @total_selling_price, @total_markup, @total_profit, @id]
      SqlRunner.run(sql, values)
      get_record_info.first.calculate_stock
    else
      return false
    end
  end

  def delete
    sql = "DELETE FROM sales WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
    get_record_info.first.calculate_stock
  end

  def self.delete_all
    sql = "DELETE FROM sales"
    SqlRunner.run(sql)
  end

  def self.map(item_to_map)
    return item_to_map.map{|item| Sale.new(item)}
  end

  def get_record_info
    record = Record.record(@record_id)
    return record
  end

  def record_buying_cost
    sale_buying_cost = (get_record_info.first.provide_buying_cost * @sale_quantity)
    return sale_buying_cost.round(2)
  end

  def record_selling_price
    sale_selling_price = (get_record_info.first.provide_selling_price * @sale_quantity)
    return sale_selling_price.round(2)
  end

  def record_markup
    sale_markup = (get_record_info.first.markup * @sale_quantity)
    return sale_markup.round(2)
  end

  def record_profit
    return (record_markup*@overhead).round(2)
  end

  def self.total_record_buying_cost
    sales = Sale.all_sales_info
    total_buying_cost = 0
    sales.each{|sale| total_buying_cost += sale['total_buying_cost'].to_f}
    return total_buying_cost.round(2)
  end

  def self.total_record_selling_price
    sales = Sale.all_sales_info
    total_selling_price = 0
    sales.each{|sale| total_selling_price += sale['total_selling_price'].to_f}
    return total_selling_price.round(2)
  end

  def self.total_record_mark_up
    sales = Sale.all_sales_info
    total_markup = 0
    sales.each{|sale| total_markup += sale['total_markup'].to_f}
    return total_markup.round(2)
  end

  def self.total_profit
    sales = Sale.all_sales_info
    total_profit = 0
    sales.each{|sale| total_profit += sale['total_profit'].to_f}
    return total_profit.round(2)
  end

  def self.provide_previous_overhead
    sql = "SELECT sales.*
    FROM sales
    ORDER BY id DESC
    LIMIT 1"
    last_sale = Sale.map(SqlRunner.run(sql))
    if last_sale.first != nil
      return last_sale.first.overhead
    else
      return 0
    end
  end

end
