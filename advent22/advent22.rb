class Advent22
  def initialize(input)
    player = 0
    @decks = [[], []]
    input.each_line(chomp: true) do |line|
      player = 1 if line == 'Player 2:'
      @decks[player] << line.to_i if line.strip =~ /^\d+$/
    end  
  end

  def part1
    deck = @decks.map{|d| Array.new(d)}
    draw(deck) until deck.any?(&:empty?)
    score(deck.reject(&:empty?)[0])
  end  

  def part2
    deck = @decks.map{|d| Array.new(d)}
    res = game(deck)
   score(deck[res])
  end

private 

  def score(deck)
    deck.reverse.zip((1..deck.size).to_a).inject(0){|sx, c| sx += c[0]*c[1]}
  end

  def draw(deck, winner = nil)
    (winner = (deck[0].first > deck[1].first ? 0 : 1)) unless winner
    cards = [deck[0].shift, deck[1].shift]
    deck[winner] << cards[winner] << cards[1 - winner] 
  end

  def game(deck)
    stack = [Array.new(deck[0]), Array.new(deck[1])]
    until deck.any?(&:empty?)
      if([0, 1].all?{|idx| deck[idx].first < deck[idx].size})
        winner = game([0, 1].map{|idx| Array.new(deck[idx][1, deck[idx].first])})
        draw(deck, winner)
      else
        draw(deck)
      end
      return 0 if [0, 1].any?{|idx| stack[idx].include?(deck[idx])}
      [0, 1].each{|idx| stack[idx] << Array.new(deck[idx])}
    end
    deck[0].empty? ? 1 : 0
  end

end
