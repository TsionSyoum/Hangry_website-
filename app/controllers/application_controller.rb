require_relative "../../config/environment"
require_relative "../models/model.rb"
# require "pry"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do
    @ingredients = INGREDIENTS
    erb :index
  end
 
  post "/results" do
    @ingredients = INGREDIENTS
    if params[:vegetables] == nil
      params[:vegetables] = []
    end
    if params[:meat_poultry_eggs] == nil
      params[:meat_poultry_eggs] = []
    end
    if params[:herbs_and_spices] == nil
      params[:herbs_and_spices] = []
    end
    if params[:grains] == nil
      params[:grains] = []
    end
    if params[:seafood] == nil
      params[:seafood] = []
    end
    if params[:nuts_and_beans] == nil
      params[:nuts_and_beans] = []
    end
    if params[:oils_and_condiments] == nil
      params[:oils_and_condiments] = []
    end
    if params[:dairy] == nil
      params[:dairy] = []
    end
    if params[:fruit] == nil
      params[:fruit] = []
    end
                  
    @selected_ingredients = []
    @selected_ingredients.push(params[:vegetables])
    @selected_ingredients.push(params[:meat_poultry_eggs])
    @selected_ingredients.push(params[:herbs_and_spices])
    @selected_ingredients.push(params[:grains])
    @selected_ingredients.push(params[:seafood])
    @selected_ingredients.push(params[:nuts_and_beans])
    @selected_ingredients.push(params[:oils_and_condiments])
    @selected_ingredients.push(params[:dairy])
    @selected_ingredients.push(params[:fruit])
    @selected_ingredients=@selected_ingredients.flatten
    puts @selected_ingredients
#     @all_ingredients = Search.all_ingredients
#     @excluded_ingredients = []
#     puts @all_ingredients
#     @all_ingredients.each do |item|
#       unless @selected_ingredients.include?(item)
#         @excluded_ingredients << item
# 		end
# 	end   
    @vegetables = params[:vegetables]
    @meat_poultry_eggs = params[:meat_poultry_eggs]
    @herbs_and_spices = params[:herbs_and_spices]
    @grains = params[:grains]
    @seafood = params[:seafood]
    @nuts_and_beans = params[:nuts_and_beans]
    @oils_and_condiments = params[:oils_and_condiments]
    @dairy = params[:dairy] 
    
#     @final_recipes = Search.search(@excluded_ingredients)
    @final_recipes = Search.search(@selected_ingredients) 
#     binding.pry
    erb :results
  end

INGREDIENTS = {:vegetables => ["Artichoke", "Arugula", "Asparagus", "Avocado", "Beetroot", "Bamboo Shoots", "Bell Peppers", "Bok choy", "Broccoli", "Brussels Sprouts", "Butternut Squash", "Cabbage", "Capsicum", "Carrots", "Cauliflower", "Celery", "Chives", "Cucumber", "Corn","Daikon", "Eggplant", "Garlic", "Ginger", "Habanero", "Jalapeno", "Kale", "Lettuce", "Mushrooms", "Okra", "Onion", "Parsley", "Parsnip", "Peas", "Peppers", "Potato", "Pumpkin", "Radish", "Rhubarb", "Rutabaga", "Scallion", "Shallot", "Spinach", "Sweet Corn", "Sweet Potato", "Taro", "Tomato", "Turnip", "Wasabi", "Watercress", "White Radish", "Yam", "Zucchini"], 
:meat_poultry_eggs => ["Eggs", "Beef", "Ham", "Lamb", "Pork", "Bacon", "Veal", "Chicken", "Chicken liver", "Duck", "Duck liver", "Gizzards", "Goose", "Goose liver", "Mutton", "Pheasant", "Turkey", "Snails"],

:herbs_and_spices => ["Anise", "Basil", "Bay Leaf", "Bebere", "Bouquet Garni", "Caraway", "Cardamom" , "Cayenne Pepper", "Chervil", "Chives", "Chia Seeds", "Chili Powder", "Cilantro", "Cinnamon", "Cloves", "Coriander", "Cumin", "Curry Leaves" , "Dukkah", "Fennel", "Fenugreek", "Garam Masala", "Garlic Powder", "Ginger", "Gochugaru", "Grains of Paradise", "Lemon Thyme", "Marjoram", "Mint", "Nutmeg", "Oregano", "Old Bay", "Paprika", "Parsley", "Peppercorns" , "Pumpkin Pie Spice Mix", "Rosemary", "Saffron", "Sage", "Sumac", "Tarragon", "Thyme", "Turmeric"],

:grains => ["Barley", "Brown rice", "Buckwheat", "Cornmeal", "Crackers", "Flaxseed", "Flour" , "Millet", "Muesli", "Oatmeal", "Oats", "Pasta", "Pita bread", "Quinoa", "Rye", "Sorghum", "Tortillas"], 


:seafood => ["Shrimp", "Eel", "Tuna", "Shellfish", "Sardines", "Salmon", "Cod", "Mackerel", "Anchovies", "Crab", "Lobster"],

:nuts_and_beans => ["Black-eyed beans", "Black beans", "Chickpeas", "Azuki beans", "Bean sprouts", "Green beans", "Kidney beans’", "Lentils", "lima beans", "Pinto beans", "Peas", "Soy beans", "Hazelnuts", "Pine nuts", "Sunflower seeds", "Mustard seeds", "Poppy seeds", "Sesame seeds", "Peanuts", "Cashew nuts", "Almonds", "Walnuts", "Macadamia nuts", "Pecan nuts", "Pistachios"],

:oils_and_condiments => ["Coconut oil", "Corn oil", "Olive oil", "Palm oil", "Peanut oil", "Sesame oil", "Soybean oil", "Sunflower oil", "Almond oil", "Brazil nut oil", "Cashew oil", "Hazelnut oil", "Macadamia oil", "Pecan oil", "Pine nut oil", "Walnut oil", "Pumpkin seed oil", "Canola oil", "Fish oil", "Ketchup", "Mustard", "Mayonnaise", "Soy sauce", "Hot sauce", "BBQ sauce", "Sour cream", "Horseradish", "Tomato Sauce", "Chilli sauce", "Fish sauce", "Maple syrup", "Jam", "Vinegar", "Worcestershire sauce", "Honey", "Chutney", "Pesto", "Teriyaki sauce", "Thai peanut sauce", "Salt", "Pepper", "Chipotles in adobo", "Vegetale stock", "Curry powder", "Tomato juice", "Apple cider vinegar", "Chilli paste"],

:dairy =>["Butter", "Buttermilk", "Cheese", "Condensed milk", "Cottage cheese", "Cream", "Cream cheese", "Custard", "Dulce de leche", "Evaporated milk", "Frozen yogurt", "Goat milk", "Ice cream", "Whipped cream", "Whole milk", "Skim milk"], 
  
:fruit => ["Açai Berries",  "Apple", "Apricot", "Avocado", "Banana", "Blackberry", "Blueberry", "Boysenberry", "Cantaloupe", "Cherry", "Coconut", "Cranberry", "Date", "Dragonfruit", "Durian", "Fig", "Gooseberry", "Grape", "Raisin", "Grapefruit", "Guava", "Honeydew", "Jackfruit", "Jujube", "Kiwi", "Kumquat", "Lemon", "Lime", "Lychee", "Mango", "Mulberry", "Nectarine", "Olive", "Orange", "Blood Orange", "Clementine", "Mandarine", "Tangerine", "Papaya", "Passionfruit", "Peach", "Pear", "Plum", "Prune", "Pineapple", "Pomegranate", "Raspberry", "Black Raspberry", "Star Fruit", "Strawberry", "Watermelon"]}
end