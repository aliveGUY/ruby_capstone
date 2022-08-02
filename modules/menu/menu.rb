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

  def validate_date(text, range)
    loop do
      print text
      input = gets.chomp
      format_ok = input.match(/\d{4}-\d{2}-\d{2}/)
      parsable = begin
        Date.strptime(input, range)
      rescue StandardError
        false
      end

      return input if format_ok && parsable

      puts 'Invalid date, please enter a valid format: '
    end
  end
end
