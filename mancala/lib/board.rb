class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.take(6).each do |cup|
      4.times { cup << :stone }
    end
    @cups[7..12].each do |cup|
      4.times { cup << :stone }
    end
  end

  def valid_move?(start_pos)
    raise InvalidStartingCupError if @cups[start_pos].empty?
    raise InvalidStartingCupError if start_pos < 0 || start_pos > 12
  end

  def make_move(start_pos, current_player_name)

    render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
   elsif @cups[ending_cup_idx].count == 1
     :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    top = @cups[7..12].all? {|cup| cup.count == 0}
    bottom = @cups.take(6).all? {|cup| cup.count == 0}
    top || bottom
  end

  def winner
    player1_score =@cups[6].count

    player2_score = @cups[13].count

    case player1_score <=> player2_score
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end

class InvalidStartingCupError < StandardError
  def message
    "Invalid starting cup"
  end
end
