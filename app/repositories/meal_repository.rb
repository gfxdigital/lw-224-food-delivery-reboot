require 'csv'

class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    @next_id = 1
    load_csv
  end

  def all
    @meals
  end

  def add(new_meal)
    new_meal.id = @next_id
    @meals << new_meal
    @next_id += 1
    save_csv
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private

  def load_csv
    return unless File.exist?(@csv_file_path)

    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      # row[:name] = row[:name]
      row[:price] = row[:price].to_i

      @meals << Meal.new(row)
      @next_id = row[:id] # always equal to last row
    end

    @next_id += 1 # last row + 1
  end


  def save_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << ['id', 'name', 'price']
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end