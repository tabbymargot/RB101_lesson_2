VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

WINNERS_LOSERS = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

puts
prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
puts
prompt("The game will continue until either the player or the
computer reaches three wins. At that point, the match will be over,
and the winning player becomes the grand winner. Good luck!")
puts
puts "-----------------------------------------"
puts

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
    puts

    # SECTION 2 - COMPARE CHOICES AND DETERMINE THE WINNER OF EACH ROUND

    # This method creates arrays containing losing values for each player.
    # It takes the WINNERS_LOSERS hash and interates through
    # each key / value pair. When the key matches the chosen item,
    # the key's values are returned and stored in a variable.
    def return_losing_values(winners_losers, choice)
      winners_losers.select do |key, value|
        if key == choice
          return value
        end
      end
    end
    player_losing_values =
      return_losing_values(WINNERS_LOSERS, player_choice)
    computer_losing_values =
      return_losing_values(WINNERS_LOSERS, computer_choice)

    # Returns true if second_choice is included in the losing_values array.
    def win?(first_choice, losing_values, second_choice)
      first_choice && losing_values.include?(second_choice)
    end

    def increment_counter(counter)
      counter + 1
    end

    if win?(player_choice, player_losing_values,
            computer_choice)
      prompt("You won this round!")
      player_counter = increment_counter(player_counter)
    elsif win?(computer_choice, computer_losing_values,
               player_choice)
      prompt("The computer won this round!")
      computer_counter = increment_counter(computer_counter)
    else
      prompt("This round is a tie!")
    end

    if player_counter < 3 && computer_counter < 3
      prompt("Your current score is #{player_counter}.")
      prompt("The computer's current score is #{computer_counter}.")
      puts
      sleep(3)
    end

    # SECTION 3 - OUTPUT THE OVERALL WINNER

    def print_winning_message(first_words)
      puts
      prompt("#{first_words} the first to 3 and therefore the winner!")
    end

    if player_counter == 3
      print_winning_message("You are")
      break
    elsif computer_counter == 3
      print_winning_message("The computer is")
      break
    end
  end

  # SECTION 4 - ASK IF PLAYER WANTS TO PLAY AGAIN

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
