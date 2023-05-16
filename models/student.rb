require_relative 'person'

class Student < Person
  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classrooom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end