require_relative '../views/view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = View.new
  end

  def list
    meals = @meal_repository.all
    @view.display_meals(meals)
  end

  def add
    # 1. ask for name
    name = @view.ask_for(:name)
    # 2. ask for price
    price = @view.ask_for(:price).to_i
    # 3. create a meal instance
    meal = Meal.new(name: name, price: price)
    # 4. store meal instance
    @meal_repository.add(meal)
  end
end
