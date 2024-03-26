require 'sqlite3'

class Rysqlitakaquest
  attr_reader :table_name, :select_columns, :where_conditions, :join_conditions

  def initialize
    @select_columns = '*'
    @where_conditions = []
    @join_conditions = []
  end

  def from(table_name)
    @table_name = table_name
    self
  end

  def select(*columns)
    @select_columns = columns.join(', ')
    self
  end

  def where(column, value)
    @where_conditions << [column, value]
    self
  end

  def join(table_name, on_condition)
    @join_conditions << { table_name: table_name, on_condition: on_condition }
    self
  end

  def run
    query = "SELECT #{@select_columns} FROM #{@table_name}"
    query += build_join_clause
    query += build_where_clause
    execute_query(query)
  end

  private

  def build_join_clause
    join_clause = ''
    @join_conditions.each do |join|
      join_clause += " JOIN #{join[:table_name]} ON #{join[:on_condition]}"
    end
    join_clause
  end

  def build_where_clause
    where_clause = ''
    unless @where_conditions.empty?
      where_clause += ' WHERE '
      conditions = @where_conditions.map { |condition| "#{condition[0]} = '#{condition[1]}'" }
      where_clause += conditions.join(' AND ')
    end
    where_clause
  end

  def execute_query(query)
    db = SQLite3::Database.new(@table_name)
    result = db.execute(query)
    db.close
    result
  end
end
