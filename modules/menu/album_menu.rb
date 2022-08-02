module Menu
  def validate
    puts 'Enter the publish date: [YYYY-MM-DD]'
    output = gets.chomp
    output = validate if output.match(/\d{4}-(?:[01][0-2])-(?:[01][0-9]|2[0-9]|3[0-1])/).nil?
    output
  end

  def album_menu(app)
    publish_date = validate
    puts 'Is it on Spotify?: [Y/N]'
    on_spotify = gets.chomp.upcase == 'Y'
    app.create_album(publish_date, on_spotify)
  end
end
