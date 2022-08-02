require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date:, on_spotify: false, id: nil)
    super(publish_date: publish_date, id: id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && @on_spotify

    false
  end
end
