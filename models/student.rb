require_relative 'person'

class Student < Person
  attr_accessor :age, :classroom, :name, :parent_permission

  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classrooom = classroom
  end

  def assign_classroom(classroom)
    @classrooom = classroom
    classroom.students << self
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
