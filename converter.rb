# A class to convert units of measurement
# To use: Converter.new(32).f_to_c == 0
class Converter

  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def c_to_f
   # Multiply by 9, then divide by 5, then add 32
   # For instance, 12C == 53.6F
     ( ((number * 9)/5) + 32 ).round(4)
  end

  def f_to_c
    # Deduct 32, then multiply by 5, then divide by 9
    # For instance, 23F == -5C
    (((number - 32) * 5)/9).round(2)
  end

  def quarts_to_cups
    # Four cups in a quart
    # So, 2 quarts == 8 cups
    number * 4
  end

  def cups_to_quarts
      number / 4
  end

  def inches_to_feet
        (number / 12).round(3)
  end

  def feet_to_inches
    number * 12
  end

  def seconds_to_milliseconds
    # 1000 milliseconds per second
    number * 1000
  end

  def milliseconds_to_seconds
    number / 1000
  end

  def feet_to_miles
    # A mile is 5280 feet
    # So, 13200 feet == 2.5 miles
    (number / 5280.0).round(4)
  end

  def miles_to_feet
    number * 5280
  end

  def feet_to_meters
    # A meter is 3.28084 feet
    # So, A mile == 1609.344 meters (when rounded to three decimals)
    (number / 3.28084).round(4)
  end

  def meters_to_feet
    (number * 3.28084).round(4)
  end

  def ounce_to_gram
    # One ounce == 28.3495 grams
    (number * 28.3495).round(4)
  end

  def gram_to_ounce
    (number / 28.3495).round(2)
  end

end

puts "Please provide a number and unit to convert:"
user_input = []
user_input = gets.chomp.split(" ")
until user_input.length == 2
  puts "Two variables expected, : #{string.length} entered."
  user_input = gets.chomp.split(" ")
end
user_input[0]= user_input.first.to_f
if user_input[0].is_a? Numeric
else
  puts "The first variable must be a number"
end
puts user_input.inspect

# students = [
#  {:name=>"Rob", :hometown=>"Indy", siblings: [nil]},
#  {:name=>"David", :hometown=>"Bloomington", siblings: ["Christine"]},
#  {:name=>"Nancy", :hometown=>"Kokomo", siblings: ["Kathy", "Judy"]},
#  {:name=>"Kalea", :hometown=>"Spokane", siblings: [nil]},
#  {:name=>"Laura", :hometown=>"KC", siblings: ["Sean", "Adam"]},
#  {:name=>"Dave", :hometown=>"Avon", siblings: ["Jess", "Rache"]},
#  {:name=>"Demetra", :hometown=>"SF", siblings: ["Desiree"]},
#  {:name=>"Kendrick", :hometown=>"Hobart", siblings: ["Erica", "Alex"]},
#  {:name=>"Phil", :hometown=>"Lynchburg", siblings: ["Andrew", "Lindsey", "Matthew", "Ellie"]},
#  {:name=>"Ben", :hometown=>"North Salem", siblings: ["Nick"]},
#  {:name=>"Michael", :hometown=>"Warsaw", siblings: ["Stephen"]},
#  {:name=>"Miguel", :hometown=>"Lake Station", siblings: ["Miana", "Yolanda", "Christina"]},
#  {:name=>"Chris", :hometown=>"Spencer", siblings: ["Sarah"]}
# ]

uom_to_methods = [
  {:uom=>"celcius", :name=>"c_to_f", :desc=>"Celsius to Fahrenheit" },
  {:uom=>"farenheit", :name=>"f_to_c", :desc=>"Farenheit to Celsius" },
  {:uom=>"quart", :name=>"quarts_to_cups", :desc=>"Quart to Cup" },
  {:uom=>"cup", :name=>"cups_to_quarts", :desc=>"Cup to Quart" },
  {:uom=>"inch", :name=>"inches_to_feet", :desc=>"Inch to Feet" },
  {:uom=>"feet", :name=>"feet_to_inches", :desc=>"Feet to Inch" },
  {:uom=>"second", :name=>"seconds_to_milliseconds", :desc=>"Second to Millisecond" },
  {:uom=>"millisecond", :name=>"milliseconds_to_seconds", :desc=>"Millisecond to Second" },
  {:uom=>"feet", :name=>"feet_to_miles", :desc=>"Feet to Miles" },
  {:uom=>"mile", :name=>"miles_to_feet", :desc=>"Miles to Feet" },
  {:uom=>"feet", :name=>"feet_to_meters", :desc=>"Feet to Meters" },
  {:uom=>"meter", :name=>"meters_to_feet", :desc=>"Meters to Feet" },
  {:uom=>"ounce", :name=>"ounce_to_gram", :desc=>"Ounce to Gram" },
  {:uom=>"gram", :name=>"gram_to_ounce", :desc=>"Gram to Ounce" }
    ]
#puts uom_to_methods.inspect


possible_methods = []
#details.select{ |item| item[:qty] != "" }

possible_methods = uom_to_methods.select {|i| i[:uom] == user_input[1]}
puts possible_methods.inspect

if possible_methods.length == 1
  puts "Cool, found the UOM and there is one method"
    puts " but I can't break out the method name"


    to_do = possible_methods[0][:name]
    puts "the selected method #{to_do}"
    #student[:name]


#    converter_results = Converter.new(user_input[0]).cups_to_quarts
    converter_results = Converter.new(user_input[0]).send(to_do)

    puts "Converting #{user_input[0]} " " #{user_input[1]} results in #{converter_results}"



 elsif possible_methods.length > 1
#  until user_input.length == 2
#    puts "Two variables expected, : #{string.length} entered."
#    user_input = gets.chomp.split(" ")
#  end
  puts "Please select one of these methods for the UOM"
else
  puts "Enter a valid value for UOM please"
end
