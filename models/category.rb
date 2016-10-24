require_relative('../db/sql_runner')


class Category

attr_reader :id, :description

  def initialize( options )
    @id = options['id'].to_i
    @description = options['description']
  end

  def save
    sql = "INSERT INTO categories (description) VALUES ('#{@description}') RETURNING *"
    results = SqlRunner.run(sql).first
    @id = results['id'].to_i
  end 


  def update(data)
    sql = "UPDATE categories SET description = '#{data[:description]}' WHERE id = #{data[:id]}"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM categories WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM categories WHERE id = #{id}"
    return category_data = Category.map_item(sql)
  end

  def self.map_items(sql)
    results = SqlRunner.run(sql)
    return results.map{ |category| Category.new(category) }
  end

  def self.map_item(sql)
    return Category.map_items(sql).first
  end

  def self.all
    sql = "SELECT * FROM categories"
    category_data = Category.map_items(sql)
    return category_data
  end

  def self.delete_all
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

 
end