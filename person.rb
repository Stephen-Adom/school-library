class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age:, name: 'unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? and @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(name: 'stephen', age: 20, parent_permission: true)
puts person.can_use_services?
