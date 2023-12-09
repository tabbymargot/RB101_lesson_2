VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end



def win?(first, second)
  
  winners_losers = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
  }
  
  (first == 'rock' && ( (second == winners_losers.fetch('rock')[0]) || (second == winners_losers.fetch('rock')[1]) ) ) ||
    (first == 'paper' && ( (second == winners_losers.fetch('paper')[0]) || (second == winners_losers.fetch('paper')[1]) ) ) ||
    (first == 'scissors' && ( (second == winners_losers.fetch('scissors')[0]) || (second == winners_losers.fetch('scissors')[1]) ) ) ||
    (first == 'lizard' && ( (second == winners_losers.fetch('lizard')[0]) || (second == winners_losers.fetch('lizard')[1]) ) ) ||
    (first == 'spock' && ( (second == winners_losers.fetch('spock')[0]) || (second == winners_losers.fetch('spock')[1]) ) )
end

def display_result(player, computer)
  # If the player's choice followed by the computer's choice
  # matches one of the expressions in win?, win? will return
  # true and You won! will be output.
  if win?(player, computer)
    prompt("You won!")

  # If the computer's choice followed by the player's choice
  # matches one of the expressions in win?, win? will return
  # true and Computer won! will be output.
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  player = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player = Kernel.gets().chomp()

    if VALID_CHOICES.include?(player)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer = VALID_CHOICES.sample

  prompt("You chose: #{player}; Computer chose: #{computer}")

  display_result(player, computer)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
