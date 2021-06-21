require_relative "view"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.all
    @view = @view.display(recipes)
    recipes
  end

  def create
    name = @view.ask_user_for_recipe
    description = @view.ask_user_for_description
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    recipes = @cookbook.all
    @view.display(recipes)
    recipe_index = @view.ask_user_for_index
    @cookbook.remove_recipe(recipe_index)
  end

end
