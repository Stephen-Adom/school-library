require_relative 'nameable'
require_relative '../decorators/capitalize_decorator'
require_relative '../decorators/trimmer_decorator'
require_relative 'book'
require_relative 'rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age:, name: 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental unless @rentals.include?(rental)
    rental.person = self
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    (rand * 1000).floor
  end
end

person1 = Person.new(age: 20, name: 'Bruce Wayne', parent_permission: true)
person2 = Person.new(age: 30, name: 'Diana Prince', parent_permission: true)

book1 = Book.new(title: 'Harry Potter and the champer of secrets', author: 'J.K. Rowlings')
book2 = Book.new(title: 'Atomic Habits', author: 'James Clear')

rental1 = Rental.new(date: '2017-11-11', book: book1, person: person1)
rental2 = Rental.new(date: '2017-10-10', book: book2, person: person2)

person1.add_rental(rental1)
person2.add_rental(rental2)

book1.add_rental(rental1)
book2.add_rental(rental2)

puts rental1.person.name
puts rental2.person.name

puts person1.rentals.count
puts person2.rentals.count

person1.rentals.each { |rental| puts rental.book.title }
person2.rentals.each { |rental| puts rental.book.title }

book1.rentals.each { |rental| puts "#{rental.book.title} was rented by #{rental.person.name}" }
book2.rentals.each { |rental| puts "#{rental.book.title} was rented by #{rental.person.name}" }
