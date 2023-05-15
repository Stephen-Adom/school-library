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
