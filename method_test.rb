
def validate_input(input)
  puts input.to_f.to_s == input || input.to_i.to_s == input
end

validate_input(".5")



# loan_duration_in_years_input.to_f.to_s == loan_duration_in_years_input || loan_duration_in_years_input.to_i.to_s == loan_duration_in_years_input
#     loan_duration_in_years = loan_duration_in_years_input.to_i
#     puts " Years: #{loan_duration_in_years}"