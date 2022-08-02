module Menu
  def game_menu(app)
    publish_date = validate_date('Enter the publish date: [YYYY-MM-DD]', '%Y-%m-%d')
    puts 'Is multiplayer?: [Y/N]'
    multiplayer = gets.chomp
    puts 'When was it last played?: [YYYY-MM-DD]'
    last_played_at = gets.chomp

    is_multiplayer = multiplayer.upcase == 'Y'
    app.create_game(publish_date, is_multiplayer, last_played_at)
  end
end
