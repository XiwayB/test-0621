class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_user_for_recipe
    puts "What is the name of your recipe?"
    return gets.chomp
  end

  def ask_user_for_description
    puts "What is the description of your recipe?"
    return gets.chomp
  end

  def ask_user_for_index
    puts "Please select a recipe?"
    return gets.chomp.to_i - 1
  end
end
