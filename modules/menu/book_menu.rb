require_relative '../../lib/book'

module Menu
  def book_menu(app)
    date_input = validate_date('Publish date [YYYY-MM-DD]: ')
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
