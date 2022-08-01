require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date:, multiplayer:, last_played_at:)
    super(publish_date: publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  private

  def can_be_archived?
    return true if super == true && (Date.today - last_played_at) / 365 > 2

    false
  end
end
