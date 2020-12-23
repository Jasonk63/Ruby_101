def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def positive_number?(num)
  num.empty? || num.to_f < 0
end

loop do
  prompt('Welcome to the Car Payment Calculator!')
  loan_amount = ''
  loop do
    prompt('Please enter the amount of the loan: ')
    loan_amount = gets.chomp
    if positive_number?(loan_amount)
      prompt('Must enter positive number!')
    elsif valid_number?(loan_amount)
      break
    else
      prompt('That does not seem to be a valid number!')
    end
  end

  apr = ''
  loop do
    prompt('Please enter the interest rate: ')
    prompt("Example: 2 for 2% or 6.5 for 6.5% ")
    apr = gets.chomp
    if positive_number?(apr)
      prompt('Must enter positive number!')
    elsif valid_number?(apr)
      break
    else
      prompt('That does not seem to be a valid number!')
    end
  end

  loan_duration_years = ''
  loop do
    prompt('Please enter the loan duration (in years): ')
    loan_duration_years = gets.chomp
    if positive_number?(loan_duration_years)
      prompt('Must enter positive number!')
    elsif valid_number?(loan_duration_years)
      break
    else
      prompt('That does not seem to be a valid number!')
    end
  end

  loan_duration_months = loan_duration_years.to_i * 12
  monthly_interest = ((apr.to_f / 12) / 100)
  monthly_payment = loan_amount.to_f * (monthly_interest / (1 -
                    (1 + monthly_interest)**(-loan_duration_months.to_i)))
  prompt("Your monthly payment is $#{format('%.2f', monthly_payment)}")
  prompt("Would you like to calculate another? (Y to calculate again): ")
  answer = gets.chomp
  break if answer.downcase != 'y'
end

prompt("Thank you for using the Loan Calculator!")
prompt("Goodbye!")
