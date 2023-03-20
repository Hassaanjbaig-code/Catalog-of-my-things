require_relative 'item'

class Main
  def initialize
    @items = []
  end

  def main
    puts 'Welcome to my app'
    loop do
      home_page
    end
  end

  def home_page
    puts 'What would you like to do?'
    puts [
      '1. Add a new item',
      '2. View all items',
      '3. View all archived items',
      '4. View all unarchived items',
      '5. Exit'
    ]
    choice = gets.chomp.to_i
    home_page_choice(choice)
  end

  def home_page_choice(choice)
    case choice
    when 1
      add_item
    when 2
      view_all_items
    when 3
      view_all_archived_items
    when 4
      view_all_unarchived_items
    when 5
      exit
    else
      puts 'Invalid choice'
    end
  end

  def add_item
    puts 'What is the genre?'
    genre = gets.chomp
    puts 'What is the author?'
    author = gets.chomp
    puts 'What is the source?'
    source = gets.chomp
    puts 'What is the label?'
    label = gets.chomp
    puts 'What is the publish date?'
    date = gets.chomp
    item = Item.new(genre, author, source, label, date)
    @items << item
  end

  def view_all_items
    @items.each_with_index do |item, index|
      puts "#{index} Genre: #{item.genre},
      Author: #{item.author}, Source: #{item.source},
      Label: #{item.label}, Publish Date: #{item.publish_date}"
    end
  end
end

main = Main.new
main.main
