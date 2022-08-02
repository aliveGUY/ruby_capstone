require_relative '../../lib/book'

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

  def book_menu(app)
    date_input = validate_date('Publish date [YYYY-MM-DD]: ', '%Y-%m-%d')
    print 'Publisher: '
    publisher = gets.chomp
    good_or_bad = validate_input_numbers('Is the cover state good(1) or bad(2)? ', (1..2))
    case good_or_bad
    when 1
      cover_state = 'good'
    when 2
      cover_state = 'bad'
    end
    app.create_book(date_input, publisher, cover_state)
    print 'Book created succesfully'
  end
end
