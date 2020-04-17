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
end
