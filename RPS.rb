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

prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
prompt("The game will continue until either the player or the
computer reaches three wins. At that point, the match will be over,
and the winning player becomes the grand winner. Good luck!")

puts "-----------------------------------------"

loop do
  player_counter = 0
  computer_counter = 0

  loop do
    # SECTION 1 - GET CHOICES FOR PLAYER AND COMPUTER

    player_input = ''
    player_choice = ''
    loop do
      prompt("Choose one of the following options:")
      VALID_CHOICES.each do |valid_choice_key, valid_choice_value|
        prompt("Type #{valid_choice_key} for #{valid_choice_value}")
      end

      player_input = Kernel.gets().chomp().downcase()

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

    # SECTION 2 - COMPARE CHOICES AND DETERMINE THE WINNER OF EACH ROUND

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

    # Create the array containing the values that lose against the player
    # choice.
    winners_losers.select do |key, value|
      if key == player_choice
        values_that_lose_against_player_choice = value
      end
    end

    # Create the array containing the values that lose against the computer
    # choice.
    winners_losers.select do |key, value|
      if key == computer_choice
        values_that_lose_against_computer_choice = value
      end
    end

    # Returns true if first choice wins against either of the values
    # in second choice
    def win?(first_choice, values_that_lose_against_first_choice, second_choice)
      first_choice && (
        (second_choice == values_that_lose_against_first_choice[0]) ||
        (second_choice == values_that_lose_against_first_choice[1])
      )
    end

    if win?(player_choice, values_that_lose_against_player_choice,
            computer_choice)
      prompt("You won this round!")
      player_counter += 1
    elsif win?(computer_choice, values_that_lose_against_computer_choice,
               player_choice)
      prompt("The computer won this round!")
      computer_counter += 1
    else
      prompt("This round is a tie!")
    end

    if player_counter < 3 && computer_counter < 3
      prompt("Your current score is #{player_counter}.")
      prompt("The computer's current score is #{computer_counter}.")
    end

    # SECTION 3 - OUTPUT THE OVERALL WINNER

    if player_counter == 3
      prompt("You are the first to 3 and you are therefore the winner!
      Well done!")
      break
    elsif computer_counter == 3
      prompt("The computer is the first to 3 and is therefore the winner.
      Better luck next time!")
      break
    end
  end

  # SECTION 4 - ASK IF PLAYER WANTS TO PLAY AGAIN

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
