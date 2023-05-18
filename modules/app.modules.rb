require_relative '../models/student'
require_relative '../models/teacher'

module CreateEntity
  def create_person
    loop do
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      person_type = gets.chomp
      if (1..2).include?(person_type.to_i)
        check_person_type(person_type)
        break
      end
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    permission = ''
    loop do
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      break if %w[n y].include? permission.downcase
    end

    new_student = Student.new(age: age, name: name, parent_permission: permission)
    save_new_people(new_student)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    new_teacher = Teacher.new(age: age, name: name, specialization: specialization)
    save_new_people(new_teacher)
  end
end


module DisplayEntity
  def list_all_books
    if @all_books.empty?
      puts "No Books available!!!\n\n"
    else
      @all_books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    if @all_people.empty?
      puts "No Person Info available!!!\n\n"
    else
      @all_people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end
end
