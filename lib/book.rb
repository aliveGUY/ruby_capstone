require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state, id: nil)
    super(publish_date: publish_date, id: id)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
