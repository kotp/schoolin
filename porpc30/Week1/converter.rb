def convert(temp, unit)
  if unit.upcase == 'C'
    if temp >= -273.15
      @out_temp = (temp * 9.0 / 5.0) + 32.0
      @out_unit = 'F'
    else
      @error_code += 1
      raise "below absolute zero."
    end
  elsif if unit.upcase == 'F'
          if temp >= -459.67
            @out_temp = (temp -32.0) * 5.0 / 9.0
            @out_unit = 'C'
          else
            @error_code +=1
            raise "below Absolute zero."
          end
        end
  else
    raise
  end
end

def parse(input)
  @args = input.split(' ')
  @temp = @args[0].to_f || 20.0
  @unit = @args[1] #|| 'C'
end

def spiel
  puts "\nWhat temperature would you like to convert?"
  puts "please enter a temperature in either C (Celcius) or F (Farenhiet)"
  puts "For example 72 F to convert 72 degrees Farenhiet to Celcius"
  puts "Control-C to quit\n"
  print "convert --> "
end

spiel
while @input = gets
  @error_code = 0
  begin
    parse(@input)
  rescue Exception
    @error_code += 1
    puts "I don't understand the input. You're probably either missing the unit or the space between the number and the unit"
    sleep 1
    puts "\nWhile you work that out, did you know:"
  end

  begin
    junk = convert(@temp, @unit)
  rescue Exception
    puts "\nUggh. Math is hard #{$!}\n"
    @error_code += 1
    sleep 1
  end

  if @error_code == 0
    puts "#{@temp} #{@unit} is #{@out_temp} #{@out_unit}."
  end
  spiel

end