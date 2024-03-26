require 'readline'
require 'csv'
require_relative 'sy_sqlite_request'

class MySQLiteCLI
  def initialize
    @database = nil
    @query = Rysqlitakaquest.new
  end

  def start
    puts "Welcome to My SQLite CLI!"
    loop do
      input = Readline.readline("sqlite> ", true)
      break if input.nil? || input.downcase == 'exit'
      process_input(input.strip)
    end
    puts "Exiting..."
  end

  private

  def process_input(input)
    case input.split.first.downcase
    when 'use'
      use_database(input.split[1])
    when 'select', 'insert', 'update', 'delete'
      execute_query(input)
    else
      puts "Invalid command."
    end
  end

  def use_database(filename)
    @database = CSV.parse(File.read(filename), headers: true)
    puts "Using database: #{filename}"
  end

  def execute_query(query)
    if @database.nil?
      puts "No database selected. Use 'USE <filename>' to select a database."
      return
    end

    case query.split.first.downcase
    when 'select'
      execute_select(query)
    else
      puts "Unsupported query type: #{query.split.first}"
    end
  end

  def execute_select(query)
    begin
      result = @query.instance_eval(query)
      display_result(result)
    rescue StandardError => e
      puts "Error executing query: #{e.message}"
    end
  end

  def display_result(result)
    result.each do |row|
      puts row.join(', ')
    end
  end
end

MySQLiteCLI.new.start if $PROGRAM_NAME == __FILE__
