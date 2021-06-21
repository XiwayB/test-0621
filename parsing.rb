require 'nokogiri'
require 'open-uri'

file = 'strawberry.html'
doc = Nokogiri::HTML(File.open(file), nil, 'utf-8')
choices = []
ratings = []
prep_times = []

doc.css('.card__detailsContainer')[0..4].each_with_index do |recipe, indexx|
  title = recipe.css('.card__title').text.strip
  choices << title
  rating = recipe.css('span.active').last.xpath("@data-rating").first.value if !recipe.css('span.active').last.nil?
  ratings << rating
  recipe_url = recipe.css('.card__detailsContainer-left a').attribute('href')
  puts recipe_url
  recipe_doc = Nokogiri::HTML(open(recipe_url).read)
  prep_time = recipe_doc.search('.recipe-meta-item-body').first.text.strip
  puts "#{indexx + 1} - #{title} - rating: #{ rating ? rating : 0 } - preparation time:#{prep_time}"
end

