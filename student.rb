require_relative 'person'

class Student < Person
  def initialize(age:, classroom:)
    super(age: age)
    @classrooom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

student = Student.new(age: 19, classroom: 'class 1')
puts student.can_use_services?
