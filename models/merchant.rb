require_relative('../db/sql_runner')


class Merchant

attr_reader :id, :name

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end 

  def save
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING *"
    merchant_data = SqlRunner.run(sql).first
    @id = merchant_data['id'].to_i
  end

  def self.delete(id)
    sql = "DELETE FROM merchants WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def update(data)
    sql = "UPDATE merchants SET name = '#{data[:name]}' WHERE id = #{data[:id]}"
  end

  def total(id)
   sql = "SELECT sum(currency) FROM transactions WHERE merchant_id = #{id}"
   data = SqlRunner.run(sql).first
   return data['sum'].to_f
  end

  def self.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM merchants"
    results = Merchant.map_items(sql)
    return results
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = #{id}"
    return Merchant.map_item(sql)
  end

  def self.map_items(sql)
    data = SqlRunner.run(sql)
    results = data.map{ |merchant| Merchant.new(merchant) }
    return results
  end

  def self.map_item(sql)
    return Merchant.map_items(sql).first
  end

end