require_relative('../db/sql_runner')


class Item

attr_reader :id, :description, :cost

  def initialize( options )
    @id = options['id'].to_i
    @description = options['description']
  end

  def self.all
    sql = "SELECT * FROM items"
    item_data = Item.map_items(sql)
    return item_data
  end

  def save
    sql = "INSERT INTO items (description) VALUES ('#{@description}') RETURNING *"
    results = Sql_runner.run(sql)
    @id = results['id']
  end 

  def update(data)
    sql = "UPDATE items SET description = '#{data[:description]}' WHERE id = #{data[:id]}"
    Sql_runner.run(sql)
  end

  def delete(id)
    sql = "DELETE FROM items WHERE id = #{id}"
    Sql_runner.run(sql)
  end

  def self.map_items(sql)
    results = Sql_runner.run(sql)
    return results.map{ |item| Item.new(item) }
  end

end