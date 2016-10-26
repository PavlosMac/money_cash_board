require_relative('../db/sql_runner')

class Transaction

attr_reader :id, :merchant_id, :category_id, :currency

  def initialize( options )
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @category_id = options['category_id'].to_i
    @currency = options['currency'].to_f
  end
 
 def save
  time_stamp = Time.now.to_i
  sql = "INSERT INTO transactions (merchant_id, category_id, currency) VALUES 
          (#{@merchant_id}, #{@category_id}, #{@currency} ) RETURNING *"
  transactions_data = SqlRunner.run(sql).first
  @id = transactions_data['id'].to_i
 end

 def merchant
  sql = "SELECT name FROM merchants WHERE id = #{@merchant_id}"
  data = SqlRunner.run(sql).first
  return data['name']
 end

 def category
  sql = "SELECT description FROM categories WHERE id = #{@category_id}"
  data = SqlRunner.run(sql).first
  return data['description']
 end


def self.update(data)
  sql = "UPDATE transactions SET currency = #{data['currency']}  WHERE id = #{data['id']}"
  SqlRunner.run(sql)
end


def self.total
    sql = "SELECT SUM(currency) FROM transactions"
    data = SqlRunner.run(sql).first
    return data['sum'].to_f
end

def self.delete(id)
  sql = "DELETE FROM transactions WHERE id = #{id}"
  SqlRunner.run(sql)
end

def self.find(id)
  sql = "SELECT * FROM transactions WHERE id = #{id}"
  return Transaction.map_item(sql)
end

def self.all
  sql = "SELECT * FROM transactions"
  results = Transaction.map_items(sql)
  return results
end

def self.delete_all
  sql = "DELETE FROM transactions"
  SqlRunner.run(sql)
end


def self.map_items(sql)
  transactions = SqlRunner.run(sql)
  result = transactions.map{ |transaction| Transaction.new( transaction ) }
  return result
end

def self.map_item(sql)
  result = Transaction.map_items(sql)
  return result.first
end

end