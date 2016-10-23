require_relative('../db/sql_runner')


class Item

attr_reader :id, :description, :cost

  def initialize( options )
    @id = options['id'].to_i
    @description = options['description']
  end



end