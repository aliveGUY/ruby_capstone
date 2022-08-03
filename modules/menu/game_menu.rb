module Menu
  def game_menu(app)
    publish_date = validate_date('Enter the publish date: [YYYY-MM-DD]')
    puts 'Is multiplayer?: [Y/N]'
    multiplayer = gets.chomp
    last_played_at = validate_date('When was it last played?: [YYYY-MM-DD]')

    is_multiplayer = multiplayer.upcase == 'Y'
    app.create_game(publish_date, is_multiplayer, last_played_at)
  end
end
