def test(b)
  b.map {|letter| puts "I like the letter: #{letter}"}
  p "b is #{b.object_id}" 
  c = "22"
  p "c is #{c.object_id}"
 end

a = ['a', 'b', 'c']
test(a)

p "a is #{a.object_id}"
