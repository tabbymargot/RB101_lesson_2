VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  # SECTION 1 - Get choices from player and computer
  player_input = ''
  player_choice = ''
  loop do
    prompt("Choose one of the following options:")
    VALID_CHOICES.each do |valid_choice_key, valid_choice_value|
      prompt("Type #{valid_choice_key} for #{valid_choice_value}")
    end

    player_input = Kernel.gets().chomp()

    VALID_CHOICES.select do |valid_choice_key, valid_choice_value|
      if player_input == valid_choice_key
        player_choice = valid_choice_value
        break
      end
    end

    if VALID_CHOICES.values.include?(player_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.values.sample

  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")
  
  # SECTION 2 - Compare choices and determine the winner
  
  # Keys are winning choices, values are losing choices
  winners_losers = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['spock', 'paper'],
    'spock' => ['scissors', 'rock']
  }

  values_that_lose_against_player_choice = ''
  values_that_lose_against_computer_choice = ''

  # Create the array containing the values that lose against the player choice.
  winners_losers.select do |key, value|
    if key == player_choice
      values_that_lose_against_player_choice = value
    end
  end

  # Create the array containing the values that lose against the computer choice.
  winners_losers.select do |key, value|
    if key == computer_choice
      values_that_lose_against_computer_choice = value
    end
  end

  # Returns true if first choice wins against either of the values
  # in second choice
  def win?(first_choice, values_that_lose_against_first_choice, second_choice)
    first_choice &&
      (
       (second_choice == values_that_lose_against_first_choice[0]) ||
       (second_choice == values_that_lose_against_first_choice[1])
     )
  end

  if win?(player_choice, values_that_lose_against_player_choice,
          computer_choice)
    prompt("You won!")
  elsif win?(computer_choice, values_that_lose_against_computer_choice,
             player_choice)
    prompt("Computer won!")
  else
    puts "It's a tie!"
  end
  
  # SECTION 3 - Ask if player wants to play again

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
