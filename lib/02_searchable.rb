require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line = (["?"] * params.length).join(", ")
    params.each do |param|

    end 
    DBConnection.execute(<<-SQL, *params)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        ?
    SQL
  end
end

class SQLObject
  extend Searchable
end
