=begin

****CASUAL****

Get the loan amount, validate and assign to a variable 
Set the Annual Percentage Rate (APR) and assign to a variable 
Get the loan duration in years, validate and assign to a variable

Calculate the monthly interest rate by dividing apr by 12, and assign to a variable 
Calculate the loan duration in months by multiplying the loan duration in years by 12, and assign to a variable 
Calculate the monthly loan amount by dividing the loan amount by the loan duration in months, and assign to a variable




Calculate the monthly payment:
monthly_payment * monthly_interest_rate

Output the monthly payment and theloan duration in months.

****FORMAL****

apr = APR
loan_amount = loan amount
monthly_loan_amount - monthly loan amount
loan_duration_in_years = loan duration in years
monthly_interest_rate = monthly interest rate
loan_duration_in_months = loan duration in months
monthly_payment = monthly payment

START

GET loan amount from user.
IF valid
  SET to loan_amount
ELSE
  Reprompt user
  
GET user's loan duration in years
IF valid
  SET to loan_duration_in_years
ELSE
  Reprompt user
  
GET APR from user.
IF valid
  SET to apr
ELSE
  Reprompt user
  
monthly_interest_rate = apr / 12

loan_duration_in_months = loan_duration_in_years * 12

monthly_loan_amount = loan_amount / loan_duration_in_months

monthly_payment = (monthly_loan_amount * monthly_interest_rate) + monthly_loan_amount

  
END
  


=end