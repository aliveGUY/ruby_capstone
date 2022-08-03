module Menu
  def album_menu(app)
    publish_date = validate_date('Enter the publish date: [YYYY-MM-DD]')
    puts 'Is it on Spotify?: [Y/N]'
    on_spotify = gets.chomp.upcase == 'Y'
    app.create_album(publish_date, on_spotify)
  end
end
