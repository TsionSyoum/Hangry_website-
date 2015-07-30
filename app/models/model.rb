require 'yummly'
require "open-uri"
require "json"
class Search
  attr_accessor :results

  def initialize
    Yummly.configure do |config|
      config.app_id = "4e9f2aa0"
      config.app_key = "e54e9cfa05d58b64bab7da2301f05c0b"
      config.use_ssl = true # Default is false
    end
  end
  
  def self.all_ingredients()
    @this_url = "http://api.yummly.com/v1/api/recipes?_app_id=4e9f2aa0&_app_key=e54e9cfa05d58b64bab7da2301f05c0b"
    recipes = open(@this_url).read
    @recipe_hash = JSON.parse(recipes)
    @matches = @recipe_hash["matches"]
    @all =[]
    @matches.each do |item|
      item["ingredients"].each do |ingredient|
        @all << ingredient
      end
    end
    
    puts @all
    return @all
  end
  
  def self.search(excluded_ingredients)
    @url = "http://api.yummly.com/v1/api/recipes?_app_id=4e9f2aa0&_app_key=e54e9cfa05d58b64bab7da2301f05c0b"
    excluded_ingredients.each do |exclude|
      exclude = exclude.gsub(" ", "+")
      
      @url += "&excludedIngredient[]=" + "#{exclude}"
    end
    recipes = open(@url).read
    return JSON.parse(recipes)
    
  end
  
end


