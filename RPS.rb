VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end



# def player_win?(first, second, lose)
  
#   (first && ( (second == lose[0]) || (second == lose[1]) ) )
 
# end

# def computer_win?(first, second, lose)
  
#   (first && ( (second == lose[0]) || (second == lose[1]) ) )
 
# end

# def display_result(player, computer, loses_against_player)
#   # If the player's choice followed by the computer's choice
#   # matches one of the expressions in win?, win? will return
#   # true and You won! will be output.
#   if player_win?(player, computer, loses_against_player)
#     prompt("You won!")

#   # If the computer's choice followed by the player's choice
#   # matches one of the expressions in win?, win? will return
#   # true and Computer won! will be output.
#   # elsif computer_win?(computer, player, loses_against_computer)
#   #   prompt("Computer won!")
#   else
#     puts "Didn't work"
#     # prompt("It's a tie!")
#   end
# end

loop do
  player_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player_choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(player_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")
  
  # Keys are winning choices, values are losing choices
  winners_losers = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
  }
  
  loses_against_player = ''
  loses_against_computer = ''

  # Set the array containing the losing values agains the player choice.
  winners_losers.select { |key, value|
    if key == player_choice
      loses_against_player = value
    end
  }
  # Set the array containing the losing values agains the computer choice.
  winners_losers.select { |key, value|
    if key == computer_choice
      loses_against_computer = value
    end
  }
  
  if player_choice &&
    ( 
      (computer_choice == loses_against_player[0]) || 
      (computer_choice == loses_against_player[1]) 
    )
    prompt("You won!")
  elsif computer_choice && 
    ( 
      (player_choice == loses_against_computer[0]) || 
      (player_choice == loses_against_computer[1]) 
    )
    prompt("Computer won!")
  else
    puts "It's a tie!"
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
