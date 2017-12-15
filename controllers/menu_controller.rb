require_relative '../models/address_book.rb'

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.size} entries"
    puts "1 - View all entries"
    puts "2 - View an entry by entry number"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "\nEnter your selection: "

    selection = gets.to_i

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        print "Enter the entry number: "
        e_num = gets.chomp
        view_entry_by_number(e_num)
        main_menu
      when 3
        system "clear"
        create_entry
        main_menu
      when 4
        system "clear"
        search_entries
        main_menu
      when 5
        system "clear"
        read_csv
        main_menu
      when 6
        puts "\nGood-bye!\n\n"
        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input\n\n"
        main_menu
    end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      puts "\n"
      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries\n\n"
  end

  def view_entry_by_number(index)
    if address_book.entries[index.to_i-1]
      new_entry = address_book.entries[index.to_i-1]
      system "clear"
      puts new_entry.to_s
      puts "\n"
    else
      system "clear"
      puts "Invalid entry number\n\n"
    end
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone Number: "
    phone_number = gets.chomp
    print "Email: "
    email = gets.chomp

    address_book.add_entry(name, phone_number, email)

    system "clear"
    puts "New entry created!\n\n"
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    print "\nSelect your option: "

    selection = gets.chomp

    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input\n\n"
        entry_submenu(entry)
    end
  end
end
