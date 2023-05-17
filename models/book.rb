class Book
  attr_accessor :title, :author, :rentals

  def initialize(title:, author:)
    @title = title
    @author = author
    @rental = []
  end

  def can_rent(rental)
    @rentals << rental unless @rentals.include?(rental)
    rental.book = self
  end
end
