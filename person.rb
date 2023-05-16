require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age:, name: 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
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

person = Person.new(age: 22, name: 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(nameable: person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(nameable: capitalized_person)
puts capitalized_trimmed_person.correct_name
