require_relative( '../db/sql_runner' )

class Label

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @location = options['location']
  end

end
