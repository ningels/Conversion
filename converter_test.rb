require 'minitest/autorun'

require './converter'

class ConversionTests < MiniTest::Test

  def execute_test(test_name, num1, num2)
    puts "execute test test_name: #{test_name}, #{num1}, #{num2}"
    test = Converter.new(num1).send(test_name)
    assert( test == num2, "#{test_name} returned #{test}, not #{num2}" )
  end


  def test_c_to_f
    execute_test("c_to_f",12.0,53.60)
  end

  def test_f_to_c
    execute_test("f_to_c",32.9,0.5)
  end

  def test_quarts_to_cups
    # Test number * 4
    test = Converter.new(8.99).quarts_to_cups
    assert( test == 35.96, "quarts_to_cups returned #{test}, not 35.96" )
  end

  def test_cups_to_quarts
    # Test number / 4
    test = Converter.new(35.9688).cups_to_quarts
    assert( test == 8.9922, "cups_to_quarts #{test}, not 8.9922" )
  end

   def test_inches_to_feet
     # Test number / 12
     test = Converter.new(48.5).inches_to_feet
     assert( test == 4.042, "inches_to_feet returned: #{test}, not 4.042" )
   end

   def test_feet_to_inches
    # Test    number * 12
       test = Converter.new(6.5).feet_to_inches
       assert( test == 78, "feet_to_inches returned: #{test}, not 78" )
   end

   def test_seconds_to_milliseconds
    #   # 1000 milliseconds per second
      test = Converter.new(0.00001).seconds_to_milliseconds
      assert( test == 0.01, "seconds_to_milliseconds returned: #{test}, not 0.01" )
   end



    def test_milliseconds_to_seconds
      test = Converter.new(0.01).milliseconds_to_seconds
      assert( test == 0.00001, "milliseconds_to_seconds returned: #{test}, not 0.00001" )
    end

    def test_feet_to_miles
    #   # A mile is 5280 feet
    #   # So, 13200 feet == 2.5 miles
    #   number / 5280
      test = Converter.new(5001).feet_to_miles
      assert( test == 0.9472, "feet_to_miles returned: #{test}, not 0.9472" )
    end

    def test_miles_to_feet
    #   number * 5280
      test = Converter.new(0.555).miles_to_feet
      assert( test == 2930.4, "miles_to_feet returned: #{test}, not 2930.4" )
    end

   def test_feet_to_meters
     # A meter is 3.28084 feet
     # So, A mile == 1609.344 meters (when rounded to three decimals)
     #    (number / 3.28084).round(3)
      test = Converter.new(777.0).feet_to_meters
      assert( test == 236.8296, "feet_to_meters returned: #{test}, not 236.8296" )
   end

    def test_meters_to_feet
     #   number * 3.28084
       test = Converter.new(5001).meters_to_feet
       assert( test == 16407.4808, "meters_to_feet returned: #{test}, not 16407.4808" )
    end

    def test_ounce_to_gram
   # One ounce == 28.3495 grams
   # number * 28.3495
     test = Converter.new(0.333).ounce_to_gram
     assert( test == 9.4404, "ounce_to_gram returned: #{test}, not 9.4404" )
    end
   #
    def test_gram_to_ounce
  #   #   number / 28.3495
       test = Converter.new(9).gram_to_ounce
       assert( test == 0.32, "gram_to_ounce returned: #{test}, not 0.32" )
    end

end
