# Ask the user for 2 numbers
# Ask the user for an operation to perform
# Perform the operation on the 2 numbers
# Output the result

# My attempt

# def prompt(message)
#   Kernel.puts("=> #{message}")
# end

# prompt("Welcome to Calculator!")

# prompt("Please enter your first number")
# first_number = Kernel.gets().chomp().to_i()

# prompt("Please enter your second number")
# second_number = Kernel.gets().chomp().to_i()

# prompt("Please choose an operation to perform")
# prompt("1 is add, 2 is subtract, 3 is multiply, 4 is divide")

# operation = Kernel.gets().chomp().to_i()

# case operation
#   when 1
#     result = first_number + second_number
#   when 2
#     result = first_number - second_number
#   when 3
#     result = first_number * second_number
#   when 4
#     result = first_number.to_f / second_number.to_f
# end

# prompt("This is the result: #{result}")

# Official solution from the video

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to calculator! Enter your name")

name = ''
loop do
  name = Kernel.gets().chomp()
  puts name
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("That doesn't look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("That doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    puts "This is the operator #{operator}"

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4.")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation? (Y to calculate again.)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Good bye!")
