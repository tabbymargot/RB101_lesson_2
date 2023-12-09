first = ''
second = ''

# def win?(first, second)
#   ((first == 'rock') && (second == 'scissors' || 'lizard')) ||
#     ((first == 'paper') && (second == 'rock' || 'spock')) ||
#     ((first == 'scissors') && (second == 'paper' || 'lizard')) ||
#     ((first == 'lizard') && (second == 'spock' || 'paper')) ||
#     ((first == 'spock') && (second == 'scissors' || 'rock'))
# end

  
  
def win?(first, second)
  (first == 'rock' && ( (second == 'scissors') || (second == 'lizard') ) ) ||
    (first == 'paper' && ( (second == 'rock') || (second == 'spock') ) ) ||
    (first == 'scissors' && second == 'paper')
end

# puts "First #{first}"
# puts "Second #{second}"


one = 'paper'
two = 'rock'

puts "This is the return #{win?(one, two)}"

# if win?('rock', 'lizard')
#     puts("You won!")
# else
#   puts("no")
# end