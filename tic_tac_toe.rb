class Board

    # position map:
    # 1 |  2 |  3
    # -----------
    # 4 |  5 |  6
    # -----------
    # 7 |  8 |  9

  def initialize(str)
    @board_string = str.gsub(/[^xo-]/,'')
  end

  def self.[](str)
    new(str)
  end

  def move(piece, position)
    @board_string[position - 1] = piece.to_s
  end

  def to_s
    @board_string.chars.each_slice(3).map(&:join).join("\n")
  end
end
