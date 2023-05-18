require_relative '../models/student'
require_relative '../models/teacher'
require_relative '../models/book'
require_relative '../models/rental'

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
    puts "New person(Student) created successfully!!\n\n"
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
    puts "New person(Teacher) created successfully!!\n\n"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'author: '
    author = gets.chomp

    new_book = Book.new(title: title, author: author)
    save_new_book(new_book)
    puts "New book created successfully!!\n\n"
  end

  def create_rental
    if @all_books.empty?
      puts "No books available!!\n\n"
    else
      puts 'Select a book from the following list by number: '
      select_book_option = ''
      loop do
        list_books_with_options
        select_book_option = gets.chomp

        break unless @all_books[select_book_option.to_i].nil?

        puts "Selected book does not exist!!!\n\n"
      end

      puts "\n"

      if @all_people.empty?
        puts "No person Info available!!\n\n"
      else
        puts 'Select a person from the following list by number (not id): '
        select_person_option = ''
        loop do
          list_person_with_options
          select_person_option = gets.chomp

          break unless @all_people[select_person_option.to_i].nil?

          puts "Selected person does not exist!!!\n\n"
        end

        puts "\n"

        print 'Date: '
        date = gets.chomp

        new_rental = Rental.new(date: date, book: @all_books[select_book_option.to_i], person: @all_people[select_person_option.to_i])

        save_rental(new_rental)

        puts "New rental created successfully!!\n\n"

      end
    end
  end
end

module DisplayEntity
  def list_all_books
    if @all_books.empty?
      puts "No Books available!!!\n\n"
    else
      @all_books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
      puts "\n\n"
    end
  end

  def list_all_people
    if @all_people.empty?
      puts "No Person Info available!!!\n\n"
    else
      @all_people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
      puts "\n"
    end
  end

  def list_books_with_options
    @all_books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    puts "\n"
  end

  def list_person_with_options
    @all_people.each_with_index { |person, index| puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    puts "\n"
  end

  def list_person_rentals
    if @all_rentals.empty?
      puts "No rentals available!!\n\n"
    else
      print 'ID Of person: '
      person_id = gets.chomp
      puts 'Rentals:'

      @all_rentals.each do |rental|
        if rental.person.id.to_i == person_id.to_i
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id.to_i
          puts "\n"
        else
          puts "No rentals for this person!!\n\n"
        end
      end
    end
  end
end
