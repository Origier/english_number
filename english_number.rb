user_input = ""

def englishNumber(num)
  num_string = ""
  write = 0

  if num == 0
    return "zero"
  elsif num < 0
    num_string += "negative "
    num = num * -1
  end
  while num > 0
    if num >= 1000000000000000000000000000000000
      write = num / 1000000000000000000000000000000000
      num_string += englishToIllion(num , 33)
      num = num - write * 1000000000000000000000000000000000
    elsif num >= 1000000000000000000000000000000
      write = num / 1000000000000000000000000000000
      num_string += englishToIllion(num , 30)
      num = num - write * 1000000000000000000000000000000
    elsif num >= 1000000000000000000000000000
      write = num / 1000000000000000000000000000
      num_string += englishToIllion(num , 27)
      num = num - write * 1000000000000000000000000000
    elsif num >= 1000000000000000000000000
      write = num / 1000000000000000000000000
      num_string += englishToIllion(num , 24)
      num = num - write * 1000000000000000000000000
    elsif num >= 1000000000000000000000
      write = num / 1000000000000000000000
      num_string += englishToIllion(num , 21)
      num = num - write * 1000000000000000000000
    elsif num >= 1000000000000000000
      write = num / 1000000000000000000
      num_string += englishToIllion(num , 18)
      num = num - write * 1000000000000000000
    elsif num >= 1000000000000000
      write = num / 1000000000000000
      num_string += englishToIllion(num , 15)
      num = num - write * 1000000000000000
    elsif num >= 1000000000000
      write = num / 1000000000000
      num_string += englishToIllion(num , 12)
      num = num - write * 1000000000000
    elsif num >= 1000000000
      write = num / 1000000000
      num_string += englishToIllion(num , 9)
      num = num - write * 1000000000
    elsif num >= 1000000
      write = num / 1000000
      num_string += englishToIllion(num , 6)
      num = num - write * 1000000
    elsif num >= 1000
      write = num / 1000
      num_string += englishToIllion(num , 3)
      num = num - write * 1000
    else
      num_string += englishTranslate(num)
      num = 0
    end
  end
  return num_string
end

def englishToIllion(num, zeros)
  higher_places = ["thousand", "million", "billion", "trillion", "quadrillion", "quintillion", "sextillion", "septillion", "octillion", "nonillion", "decillion"]
  num_string = ""
  div_string = "1"
  zeros.times do 
    div_string += "0"
  end
  illions = num / div_string.to_i
  num = num - illions * div_string.to_i
  if illions >= 1000
    num_string += "#{englishNumber(illions)}#{higher_places[zeros/3 - 1]} "
  else
    num_string += "#{englishTranslate(illions)}#{higher_places[zeros/3 - 1]} "
  end
  return num_string
end

def englishTranslate(num)
  ones_place = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  tens_place = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
  teens = ["eleven", "twelve", "thirteen", "forteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  num_string = ""
  write = 0
  while num > 0 do
    if num >= 100
      write = num / 100
      num = num - write * 100
      num_string += "#{ones_place[write - 1]} hundred "
    elsif num >= 10
      write = num / 10
      num = num - write * 10
      if num == 0 and write == 1
        num_string += "ten "
      elsif write == 1
        num_string += "#{teens[num - 1]} "
        num = 0
      else
        num_string += "#{tens_place[write - 2]} "
      end
    else
      num_string += "#{ones_place[num - 1]} "
      num = 0
    end
  end
  return num_string
end

while user_input != "end" do
  puts "Enter an integer you would like converted to english words or enter end to quit: "
  user_input = gets.chomp
  if user_input != "end"
    puts englishNumber(user_input.to_i).capitalize
  end
end

