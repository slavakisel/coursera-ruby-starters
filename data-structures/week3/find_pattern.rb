class NaiveFinder
  def initialize(text, pattern)
    @text = text
    @pattern = pattern
  end

  def perform
    result = []

    for i in 0..(@text.size - @pattern.size + 1)
      next unless @text[i..i + @pattern.size - 1] == @pattern
      result << i
    end

    puts result.join(' ')
  end
end

class RabinKarpFinder
  def initialize(text, pattern)
    @text = text
    @pattern = pattern
  end

  def perform
    result = []

    # TODO: Implement the fast version of the Rabin–Karp’s algorithm from the lectures.

    puts result.join(' ')
  end
end

pattern = gets.chomp
text = gets.chomp
NaiveFinder.new(text, pattern).perform
