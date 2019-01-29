# TODO: implement the router of your app.
class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
    @running = true
  end

  def run
    while @running
      choice = display_menu
      print `clear`
      action(choice)
    end
  end

  private

  def display_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all meals"
    puts "2 - Add a new meal"
    puts "9 - Quit"
    print "> "
    gets.chomp.to_i
  end

  def action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 9 then @running = false
    else
      puts "Try again..."
    end
  end
end