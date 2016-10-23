require_relative('../db/sql_runner')


class Merchant

attr_reader :id, :name

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end 

  def save
    sql = "INSERT INTO merchants (name) VALUES '#{@name}' RETURNING *"
    merchant_data = SqlRunner.run(sql).first
    @id = merchant_data['id'].to_i
  end

  def delete(id)
    sql = "DELETE FROM merchants WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def update(data)
    sql = "UPDATE merchants SET name = '#{data[:name]}' WHERE id = #{data[:id]}"
  end

  def self.delete_all
    sql = "DELETE * FROM merchants"
    SqlRunner.run(sql)
  end

end