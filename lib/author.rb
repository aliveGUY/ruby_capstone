class Author
  attr_accessor :first_name, :last_name
  attr_reader :items, :id

  def initialize(first_name:, last_name:)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item:)
    raise TypeError unless item.respond_to?(:move_to_archive)

    @items << item
    item.add_author(self)
  end
end
