require "open-uri"
require "json"

class Search
  attr_accessor :results

#   def self.all_ingredients()
#     @this_url = "http://api.yummly.com/v1/api/recipes?_app_id=4e9f2aa0&_app_key=e54e9cfa05d58b64bab7da2301f05c0b&maxResult=100&start=10"
#     recipes = open(@this_url).read
#     @recipe_hash = JSON.parse(recipes)
#     @matches = @recipe_hash["matches"]
#     @all =[]
#     @matches.each do |item|
#       item["ingredients"].each do |ingredient|
#         unless @all.include?(ingredient)
#           @all << ingredient
# 		    end
        
#       end
#     end
    
#     return @all
#   end
  
#   def self.search(excluded_ingredients)
#     @url = "http://api.yummly.com/v1/api/recipes?_app_id=4e9f2aa0&_app_key=e54e9cfa05d58b64bab7da2301f05c0b"
#     puts excluded_ingredients
#     counter = 0
#     excluded_ingredients.each do |exclude|
#       exclude = exclude.gsub(" ", "+")
      
#       @url += "&excludedIngredient[]=" + "#{exclude}"
#       break if counter > 230
#       counter += 1
#     end
  
#     recipes = open(@url).read
#     return JSON.parse(recipes)
#   end
  
  def self.search(allowed_ingredients)
    @url = "http://api.yummly.com/v1/api/recipes?_app_id=4e9f2aa0&_app_key=e54e9cfa05d58b64bab7da2301f05c0b"
    allowed_ingredients.each do |allowed|
      allowed = allowed.gsub(" ", "+")
      
      @url += "&allowedIngredient[]=" + "#{allowed}"
      
    end
    
    @url += "&maxResult=1000&start=10"
  
    recipes = open(@url).read
    return JSON.parse(recipes)
  end
end


