n = gets.to_i
data = gets.split(' ').map(&:to_i)
swaps = []

# The following naive implementation just sorts
# the given sequence using selection sort algorithm
# and saves the resulting sequence of swaps.
# This turns the given array into a heap,
# but in the worst case gives a quadratic number of swaps.
#
# TODO: replace by a more efficient implementation

for i in 0...data.size
  for j in 0...data.size
    if data[i] > data[j]
      swaps << [i, j]

      data[i], data[j] = data[j], data[i]
    end
  end
end

puts swaps.size
swaps.each do |swap|
  puts swap.join(' ')
end
