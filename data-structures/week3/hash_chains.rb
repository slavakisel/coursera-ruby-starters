class HashTable
  attr_reader :check_log

  def initialize(bucket_count)
    @bucket_count = bucket_count

    @table = []
    @multiplier = 263
    @prime = 1000000007
    @check_log = ""
  end

  private

  def hash_func(str)
    hash = 0

    (str.size - 1).downto(0) do |i|
      hash = (hash * @multiplier + str[i].ord) % @prime
    end

    hash % @bucket_count
  end
end

class NaiveHashTable < HashTable
  def add(string)
    @table.unshift(string) unless @table.include?(string)
  end

  def find(string)
    @check_log += @table.include?(string) ? "yes\n" : "no\n"
  end

  def del(string)
    @table.delete(string)
  end

  def check(bucket_num)
    bucket_num = bucket_num.to_i

    @table.each do |string|
      next unless hash_func(string) == bucket_num

      @check_log += string + " "
    end

    @check_log += "\n"
  end
end

class OptimizedHashTable < HashTable
  def add(string)
    # TODO: insert string into the table. If there is already such string in the hash table, then
    # just ignore the query.
  end

  def find(string)
    # TODO: output “yes” or “no” (without quotes) depending on whether the table contains
    # string or not
  end

  def del(string)
    # TODO: remove string from the table. If there is no such string in the hash table, then just
    # ignore the query.
  end

  def check(bucket_num)
    bucket_num = bucket_num.to_i
    # TODO: output the content of the i-th list in the table. Use spaces to separate the elements
    # of the list. If i-th list is empty, output a blank line.
  end
end

bucket_count = gets.to_i
query_count = gets.to_i

# TODO: replace this naive implementation by faster algorithm
hash_table = NaiveHashTable.new(bucket_count)

query_count.times do
  operation, arg = gets.split(' ')
  hash_table.public_send(operation, arg)
end

puts hash_table.check_log
