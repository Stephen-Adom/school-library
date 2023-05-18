require_relative '../modules/app.modules'

class App
  attr_accessor :name, :option
  attr_reader :all_books, :all_rentals, :all_people

  include DisplayEntity
  include CreateEntity

  def initialize
    @name = nil
    @all_books = []
    @all_people = []
    @all_rentals = []
  end

  def check_person_type(person_type)
    case person_type.to_i
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def save_new_people(person)
    @all_people << person
  end

  def save_new_book(book)
    @all_books << book
  end

  def save_rental(rental)
    @all_rentals << rental
  end

  def app_options
    puts 'Please choose an option by entering a number:'
    puts "1 - List all books\n2 - List all people\n3 - Create a person\n4 - Create a book\n5 - Create a rental\n6 - List all rentals for a given person id\n7 - Exit"
    print 'Your option '
    @option = gets.chomp
  end

  def check_option(option)
    case option.to_i
    when 1
      puts option.to_i
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental

    end
  end

  def run
    loop do
      app_options

      puts "Your input is invalid. Please enter then correct option value........\n" unless (1..7).include?(@option.to_i)

      if @option.to_i == 7
        puts 'Thank you for using the app....'
        break
      end

      check_option(@option)
    end
  end
end
