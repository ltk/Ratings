class Battle
  def initialize(a,b)
    @a, @b = a, b
    puts "\nChoose a victor: "
    puts "a: Image #{@a.id}"
    puts "b: Image #{@b.id}"
    while input = gets.strip do
      if input == "a"
        @a.win(@b)
        break
      elsif input == "b"
        @b.win(@a)
        break
      end
    end
  end
end