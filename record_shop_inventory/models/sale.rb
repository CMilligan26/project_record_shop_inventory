require_relative( '../db/sql_runner' )

class Sale

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

end
