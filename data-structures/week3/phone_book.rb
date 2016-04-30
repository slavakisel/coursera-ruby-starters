# TODO: replace this naive implementation by faster algorithm

class NaivePhoneBook
  attr_reader :search_log

  def initialize
    @book = []
    @search_log = ""
  end

  def add(number, name)
    was_found = false
    @book.each do |contact|
      next unless contact[0] == number

      contact[1] = name
      was_found = true
      break
    end

    @book << [number, name] unless was_found
  end

  def find(number, _name)
    name = "not found"

    @book.each do |contact|
      next unless contact[0] == number

      name = contact[1]
      break
    end

    @search_log << name + "\n"
  end

  def del(number, _name)
    @book.delete_if { |contact| contact[0] == number }
  end
end

n = gets.to_i
book = NaivePhoneBook.new

n.times do
  operation, phone_num, name = gets.split(' ')
  book.public_send(operation, phone_num, name)
end

puts book.search_log
