# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'router'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/meal_repository'

meal_repository = MealRepository.new('data/meals.csv')
meal_controller = MealsController.new(meal_repository)
router = Router.new(meal_controller)
router.run