class Genre
  attr_reader :name, :id, :items

  def initialize(_name)
    @id = Random.rand(1..100)
    @items = []
  end

  def add_item(item)
    item.add_genre(self)
    @items << item
  end
end
