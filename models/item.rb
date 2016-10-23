require_relative('../db/sql_runner')


class Item

  def initialize( options )
    @id = options['id'].to_i
    @description = options['description']
    @cost = options['cost'].to_i
  end



end