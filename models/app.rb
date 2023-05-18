class App
  attr_accessor :name, :option, :all_books, :all_rentals, :all_people

  def initialize
    @name = nil
    @all_books = []
    @all_people = []
    @all_rentals = []
  end

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

  def app_options
    puts 'Please choose an option by entering a number:'
    puts "1 - List all books\n2 - List all people\n3 - Create a person\n4 - Create a book\n5 - Create a rental\n6 - List all rentals for a given person id\n7 - Exit"
    print 'Your option '
    @option = gets.chomp
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

  def check_option(option)
    case option.to_i
    when 1
      puts option.to_i
      list_all_books
    when 2
      list_all_people

    end
  end
end
