require_relative('../db/sql_runner')

class Transaction

  def initialize( options )
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @category_id = options['category_id'].to_i
    @cost = options['cost'].to_f
  end
 
 def save
  sql = "INSERT INTO transactions (merchant_id, category_id, cost) VALUES 
          ('#{@merchant_id}', '#{@category_id}', #{@cost} ) RETURNING *"
  transactions_data = Transaction.map_items(sql)
  return transactions_data
 end

 def update
  sql = "UPDATE transactions SET ( merchant_id, category_id, cost) = (#{@merchant_id}, #{@item_id}, #{@cost} ) WHERE id = #{@id}"
  SqlRunner.run(sql)
  end

def self.delete(id)
  sql = "DELETE FROM transactions WHERE id = #{id}"
  SqlRunner.run(sql)
end

def self.find(id)
  sql = "SELECT * transactions WHERE id = #{id}"
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