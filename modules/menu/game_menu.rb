module Menu
  def game_menu(app)
    puts 'Enter the publish date: [YYYY-MM-DD]'
    publish_date = gets.chomp
    puts 'Is multiplayer?: [Y/N]'
    multiplayer = gets.chomp
    puts 'When was it last played?: [YYYY-MM-DD]'
    last_played_at = gets.chomp

    is_multiplayer = multiplayer.upcase == 'Y'
    app.create_game(publish_date, is_multiplayer, last_played_at)
  end
end
