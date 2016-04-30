class Table
  attr_reader :parent

  def initialize(rows_num)
    @number_of_rows = rows_num
    @rank = 0
    @parent = self
  end
end

def merge(destination, source)
  real_destination = destination.parent
  real_source = source.parent

  return if real_destination == real_source

  # TODO: merge two components here
  # use rank heuristic
  # update maximum_number_of_rows
end

maximum_number_of_rows = -1
output = ''

n, m = gets.split(' ').map(&:to_i)

tables_rows = gets.split(' ').map(&:to_i)
tables = (0...n).map { |i| Table.new(i) }
maximum_number_of_rows = tables_rows.max

for i in 0...m
  destination, source = gets.split(' ').map { |e| e.to_i - 1 }
  merge(tables[destination], tables[source])
  output += "#{maximum_number_of_rows}\n"
end

puts output
