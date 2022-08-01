class Genre
  attr_reader :name
  attr_reader :id, :items
  def initialize(name)
    @id = Random.rand(1..100)
    @items = []
  end

  def add_item(item)
    items << item
  end

end