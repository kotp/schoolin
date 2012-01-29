def convert(temp, unit)
  if unit == 'C'
    @out_temp = temp * 9.0 / 5.0 + 32.0
    @out_unit = 'F'
  elsif @out_temp = temp *5.0 / 9.0 - 32.0
    @out_unit = 'C'
  else
    raise Exception "bad input"
  end
end

def parse(input)
  args  = input.split
  @temp = args[0].to_f || 20.0
  @unit = args[1].upcase! || 'C'
end

def spiel
  puts "\nWhat temperature would you like to convert?"
  puts "please enter a temperature in either C (Celcius) or F (Farenhiet)"
  puts "For example 72 F to convert 72 degrees Farenhiet to Celcius"
  puts "Control-C to quit\n"
  print "convert --> "
end

spiel
while input = gets

  begin
    parse(input)
  rescue Exception
    puts "I don't understand the input. You're probably either missing the unit or the space between the number and the unit"
    sleep 1
    puts "\nWhile you work that out, did you know:"
  end

  begin
    convert(@temp, @unit)
  rescue Exception
    puts "\nUggh. Math is hard. #{$!}\n"
    sleep 1
  end

  puts "#{@temp} #{@unit} is #{@out_temp} #{@out_unit}."
  spiel

end