require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :age, :classroom, :name, :parent_permission

  def initialize(age:, name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
  end

  def assign_classroom(classroom)
    @classrooom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def classroom_info
    @classrooom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

classroom1 = Classroom.new(label: 'class 1')
classroom2 = Classroom.new(label: 'class 2')
classroom3 = Classroom.new(label: 'class 3')

student1 = Student.new(age: 10, name: 'Ariel')
student2 = Student.new(age: 9, name: 'Josh')
student3 = Student.new(age: 13, name: 'Clement')

classroom3.add_student(student3)

student1.assign_classroom(classroom1)
student2.assign_classroom(classroom2)

classroom1.students.each { |student| puts student.name }
classroom2.students.each { |student| puts student.name }
classroom3.students.each { |student| puts student.name }

puts student1.classroom_info.label
puts student2.classroom_info.label
