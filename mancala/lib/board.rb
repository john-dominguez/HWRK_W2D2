class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){0}

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each {|cup| cup.count = 4}
    @cups[6].count = 0
    @cups[13].count = 0
  end

  def valid_move?(start_pos)
  end

  def make_move(start_pos, current_player_name)

    render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
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
  end
end
