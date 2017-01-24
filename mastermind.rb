class Game
  def initialize (slots = 4, colors = 2)
    @slots = slots
    @colors = colors
    @turn_cnt = 0
    $game_over = 0
  end

  def create_key
    @key = []
    @temp_key =[]
    i=0
    @slots.times do
      @key[i] = rand(1..@colors)
      @temp_key[i] = @key[i].to_s
      i += 1
    end
  end

  def play_turn
    @turn_cnt += 1
    print "Make guess ##{@turn_cnt} >>"
    @guess = gets.chomp
    @guess = @guess.split(/ /)
  end

  def show_board
    @guess.each {|n| print n.to_s + "  "}
    puts " "
  end

  def check_results
  #  puts @key.inspect
    check_for_pegs
    print "Black pegs: #{@bcnt}, White pegs: #{@wcnt}"
    puts " "
    if @bcnt == @slots
      puts "You Win in #{@turn_cnt} moves!"
      $game_over = 1
    end
  end

  def check_for_pegs
    i = 0; j = 0; @bcnt = 0; @wcnt = 0;
    @slots.times do
      if @guess[i] == @temp_key[i]
        @bcnt += 1
        @guess[i] = "a"
        @temp_key[i] = "b"
      end
      i += 1
    end
    @guess.each do |g|
      @temp_key.each do |k|
        if g == k
          @wcnt += 1
          g = "c"
          k = "d"
        end
      end
    end
    @slots.times do
    @temp_key[j] = @key[j].to_s
      j += 1
    end
  end
end

system('clear')
print "How many slots? >>"
slots = gets.chomp.to_i
print "How many colors >>"
colors = gets.chomp.to_i

g = Game.new(slots, colors)
g.create_key
while $game_over == 0
  g.play_turn
  g.show_board
  g.check_results
end
