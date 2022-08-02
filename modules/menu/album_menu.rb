module Menu
  def album_menu(app)
    puts 'Enter the publish date: [YYYY-MM-DD]'
    publish_date = gets.chomp
    if publish_date.match(/\d{4}-(?:[01][0-2])-(?:[01][0-9]|2[0-9]|3[0-1])/).nil?
      album_menu(app)
    else
      Date.parse(publish_date)
    end
    puts 'Is it on Spotify?: [Y/N]'
    on_spotify = gets.chomp
    on_spotify = on_spotify.upcase == 'Y'
    app.create_album(publish_date, on_spotify)
  end
end