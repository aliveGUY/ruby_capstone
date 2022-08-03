require_relative 'main_menu'
require_relative 'game_menu'
require_relative 'album_menu'
require_relative 'book_menu'

module Menu
  def validate_input_numbers(text, range)
    loop do
      print text
      input = gets.chomp.to_i
      return input if range.include?(input)
    end
  end

  def validate_date(text)
    puts text
    output = gets.chomp
    if output.match(/\d{4}-(?:[01][0-2])-(?:[01][0-9]|2[0-9]|3[0-1])/).nil?
      puts 'please enter correct input'
      output = validate_date(text)
    end
    output
  end
end
