require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    question_marks = (["?"] * params.length).join(", ")
    where_line = params.map do |key, val|
      "#{key} = ? "
    end
    where_line = where_line.join("AND ")
    search = DBConnection.execute(<<-SQL, *params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_line}
    SQL
    search.map do |item|
      self.new(item)
    end
  end
end

class SQLObject
  extend Searchable
end
