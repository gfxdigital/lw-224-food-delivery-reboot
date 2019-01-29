class View
  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.id}: #{meal.name}x - #{meal.price}€"
    end
  end

  def ask_for(attribute_name)
    puts "What is the #{attribute_name}?"
    print '> '
    gets.chomp
  end
end