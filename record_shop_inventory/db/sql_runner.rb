require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect( {dbname: 'd6ssqjusdf7pbk',
host: 'ec2-23-21-171-25.compute-1.amazonaws.com',
port: 5432, user: 'cudqfkephfpmvy', password: '0869aa85edc46cbaabecc5e6f49c50b76a1261c474da440502c2a9d4b28118c5'})
db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
