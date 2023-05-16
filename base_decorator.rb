require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(nameable:)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

namea = Nameable.new
dec = BaseDecorator.new(nameable: namea)
puts dec.correct_name
