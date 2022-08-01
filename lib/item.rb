require 'date'

class Item
  attr_reader :id, :archived, :genre, :author, :source, :label
  attr_accessor :publish_date

  def initialize(publish_date:)
    @id = Random.rand(1..100)
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self) 
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self) 
  end

  def add_source(source)
    @source = source
    source.items.push(self) unless source.items.include?(self) 
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self) 
  end

  private

  def can_be_archived?
    return true if (Date.today - @publish_date) / 365 > 10

    false
  end

  public

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
