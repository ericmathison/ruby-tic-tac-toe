# position map:
# 1 |  2 |  3
# -----------
# 4 |  5 |  6
# -----------
# 7 |  8 |  9

class Board
  attr_reader :raw

  def initialize(str)
    @raw = str.gsub(/[^xo-]/,'')
  end

  def self.[](str)
    new(str)
  end

  def move(piece, position)
    @raw[position - 1] = piece.to_s
  end

  def position_open?(n)
    @raw[n - 1] == '-'
  end

  def won?(sym)

    # Checks for win using magic square where every three in a row sequence
    # totals 15. If any combination of three numbers corresponding to a
    # player's positions equals 15 then that player has won.

    # Magic Square:
    # 4 |  9 |  2
    # -----------
    # 3 |  5 |  7
    # -----------
    # 8 |  1 |  6

    [4, 9, 2, 3, 5, 7, 8, 1, 6]
      .select.with_index { |n, i| @raw[i] == sym.to_s }
      .combination(3).map(&:sum).include?(15)
  end
end
