require_relative 'person'

class Teacher < Person
  def initialize(age:, specialization:)
    super(age: age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teach = Teacher.new(age: 20, specialization: 'teach')
puts teach.can_use_services?
