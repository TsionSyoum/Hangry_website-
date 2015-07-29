require_relative "../../config/environment"
require_relative "../models/model.rb"

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
    "HI"
  end


INGREDIENTS = {:vegetables => ["Artichoke”, “Arugula”, “Asparagus”, “Beetroot”, “Bell Peppers”, “Bok choy”, “Broccoli”, “Brussels Sprouts”, “Butternut Squash”, “Cabbage”, “Capsicum”, “Carrot”, “Cauliflower”, “Celery”, “Chives”, “Cucumber”, “Daikon”, “Eggplant”, “Garlic”, “Ginger”, “Habanero”, “Jalapeno”, “Kale”, “Lettuce” “Mushrooms”, “Okra”, “Onion”, “Parsley”, “Parsnip”, “Peas”, “Peppers”, “Potato”, “Pumpkin”, “Radish”, “Rhubarb”, “Rutabaga”, “Scallion”, “Shallot”, “Spinach”, “Sweet Corn”, “Sweet Potato”, “Taro”, “Tomato”, “Turnip”, “Wasabi”, “Watercress”, “White Radish”, “Yam”, “Zucchini"], 
:meat_poultry_eggs => ["Eggs”, “Beef”, “Ham”, “Lamb”, “Pork”, “Bacon”, “Veal”, “Chicken”, “Chicken liver”, “Duck”, “Duck liver”, Gizzards”, “Goose”, “Goose liver”, “Mutton”, “Pheasant”, “Turkey”, “Snails"],

:herbs_and_spices => ["Anise”, “Basil”, “Bay Leaf”, “Bebere”, “Bouquet Garni”, “Caraway”, “Cardamom” , “Cayenne Pepper”, “Chervil”, “Chives”, “Chia Seeds”, “Chili Powder”, “Cilantro”, “Cinnamon”, “Cloves”, “Coriander”, “Cumin”, “Curry Leaves” , “Dukkah”, “Fennel”, “Fenugreek”, “Garam Masala”, “Garlic Powder”, “Ginger”, “Gochugaru”, “Grains of Paradise”, “Lemon Thyme”, “Marjoram”, “Mint”, “Nutmeg”, “Oregano”, “Old Bay”, “Paprika”, “Parsley”, “Peppercorns” , “Pumpkin Pie Spice Mix”, “Rosemary”, “Saffron”, “Sage”, “Sumac”, “Tarragon”, “Thyme”, “Turmeric"],

:grains => ["Barley”, “Brown rice”, “Buckwheat”, “Cornmeal”, “Crackers”, “Flaxseed”, “Flour” , “Millet”, “Muesli”, “Oatmeal”, “Oats”, “Pasta”, “Pita bread”, “Quinoa”, “Rye”, “Sorghum”, “Tortillas"], 


:seafood => ["Shrimp”, “Eel”, “Tuna”, “Shellfish”, “Sardines”, “Salmon”, “Cod”, “Mackerel”, “Anchovies”, “Crab”, “Lobster"],

:nuts_and_beans => ["Black-eyed beans”, “Black beans”, “Chickpeas”, “Azuki beans”, “Bean sprouts”, “Green beans”, “Kidney beans’”, “Lentils”, “lima beans”, “Pinto beans”, “Peas”, “Soy beans”, “Hazelnuts”, “Pine nuts”, “Sunflower seeds”, “Mustard seeds”, “Poppy seeds”, “Sesame seeds”, “Peanuts”, “Cashew nuts”, “Almonds”, “Walnuts”, “Macadamia nuts”, “Pecan nuts”, “Pistachios"],

:oils_and_condiments => ["Coconut oil”, “Corn oil”, “Olive oil”, “Palm oil”, “Peanut oil”, “Sesame oil”, “Soybean oil”, “Sunflower oil”, “Almond oil”, “Brazil nut oil”, “Cashew oil”, “Hazelnut oil”, “Macadamia oil”, “Pecan oil”, “Pine nut oil”, “Walnut oil”, “Pumpkin seed oil”, “Fish oil”, “Ketchup”, “Mustard”, “Mayonnaise”, “Soy sauce”, “Hot sauce”, “BBQ sauce”, “Sour cream”, “Horseradish’, “Tomato Sauce”, “Chilli sauce”, “Fish sauce”, “Maple syrup”, “Jam”, “Vinegar”, “Worcestershire sauce”, “Honey”, “Chutney”, “Pesto”, “Teriyaki sauce”, “Thai peanut sauce"],

:dairy =>["Butter”, ”Buttermilk”, ”Cheese”, ”Condensed milk”, “Cottage cheese”, “Cream”, “Cream cheese”, ”Custard”, ”Dulce de leche”, “Evaporated milk”, ”Frozen yogurt”, “Goat milk”, ”Ice cream”, “Whipped cream”, ”Whole milk”, “Skim milk"]}
end