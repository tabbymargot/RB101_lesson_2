def prompt(message)
  puts("=> #{message}")
end

# Verify that the input string is a positive number
# (either an integer or a float)
def validate_number(input)
  input.to_i.to_s == input || input.to_f.to_s == input
end

def validate_greater_than0(input)
  input.to_i > 0 || input.to_f > 0.0
end

# Verify that the input string is a positive number (integer only)
def validate_whole_number(input)
  input.to_i.to_s == input
end

def validate_not_less_than0(input)
  input.to_i >= 0 || input.to_f >= 0.0
end

def validate_less_than12(input)
  input.to_i < 12
end

def convert_to_integer(input)
  input.to_i
end

def convert_to_float(input)
  input.to_f
end

prompt("Please enter your mortgage loan amount using only numbers
  (no currency symbols or decimal points):")

loan_amount_input = ''
loan_amount = ''
loop do
  loan_amount_input = gets.chomp

  if validate_number(loan_amount_input) &&
     validate_greater_than0(loan_amount_input)

    loan_amount = loan_amount_input.to_i
    break
  else
    puts "That is not a valid amount. Please try again,
    making sure you are only entering whole numbers above 0."
  end
end

puts "We will now ask you to enter the duration of your loan.
At the first prompt, please enter the duration in years.
At the second prompt, add any additional months. For example,
if your loan is for 6 years and 3 months, enter 6 at the first
  prompt and 3 at the second. Please only enter whole numbers above 0."
puts "-------------------------------"

loan_duration_in_years = ''
loop do
  prompt("Please enter the duration of your loan in years.
  If the duration is for less than 12 months, enter 0 .")
  loan_duration_in_years_input = gets.chomp

  if validate_whole_number(loan_duration_in_years_input) &&
     validate_not_less_than0(loan_duration_in_years_input)

    loan_duration_in_years = convert_to_integer(loan_duration_in_years_input)
    break
  else
    puts "That is not a valid duration. Please try again,
    making sure you are only entering whole numbers above 0."
  end
end

additional_months = ''
loop do
  prompt("Please enter any additional months.
  If there are no additional months, enter 0 .")
  additional_months_input = gets.chomp

  if validate_whole_number(additional_months_input) &&
     validate_not_less_than0(additional_months_input) &&
     validate_less_than12(additional_months_input)

    additional_months = convert_to_integer(additional_months_input)
    break
  else
    puts "That is not a valid duration. Please try again,
    making sure you are only entering a whole number between 0 and 11."
  end
end

apr = ''
loop do
  prompt("Please enter the yearly interest rate (APR).")
  apr_input = gets.chomp

  if apr_input[0] == "."
    apr_input.insert(0, "0")
  end

  if apr_input[-1] == "%"
    apr_input.chop!
  end

  if validate_number(apr_input) && validate_greater_than0(apr_input)
    apr = convert_to_float(apr_input) / 100
    break
  else
    puts "That is not a valid APR. Please try again,
    making sure you are entering a number greater than 0."
  end
end

monthly_interest_rate = apr / 12

loan_duration_in_months = (loan_duration_in_years * 12) + additional_months

monthly_payment = loan_amount * (monthly_interest_rate /
(1 - ((1 + monthly_interest_rate)**(-loan_duration_in_months))))

puts "Your repayments will be £#{monthly_payment.ceil(2)} per month."
