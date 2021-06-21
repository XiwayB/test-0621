require 'csv'
require_relative 'recipe'

class Cookbook
  # TO DO load the CSV file
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3])
    end
  end

  # TO DO return all the recipes
  def all
    @recipes
  end

  # TO DO add new recipes in the cookbook
  def add_recipe(recipe)
    @recipes << recipe
    store_csv
  end

  # TO DO remove recipes in the cookbook
  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    store_csv
  end

  def store_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

end
