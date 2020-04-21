require_relative 'board.rb'
require 'minitest/autorun'

# position map:
# 1 |  2 |  3
# -----------
# 4 |  5 |  6
# -----------
# 7 |  8 |  9

class TestBoard < Minitest::Test
  def setup
    @blank_board = Board['--- --- ---']
    @board_ignores_strange_characters = Board["-abc123--\n -\n\n-- \n -xo"]
    @board_state_one = Board['--- -o- x-x']
    @board_state_two = Board['o-- --- --x']
    @board_state_three = Board['-x- o-- --x']
    @x_wins_once = Board['x-- x-o x-o']
    @x_wins_twice = Board['x-- ox- o-x']
    @x_wins_thrice = Board['oxx oox xox']
    @o_wins_once = Board['o-- xo- xxo']
    @o_wins_twice = Board['ooo x-- x-x']
  end

  def test_raw
    assert_equal @blank_board.raw, '---------'
    assert_equal @board_ignores_strange_characters.raw, '-------xo'
    assert_equal @board_state_one.raw, '----o-x-x'
    assert_equal @board_state_two.raw, 'o-------x'
  end

  def test_move
    @blank_board.move(:x, 9)
    assert_equal @blank_board.raw, '--------x'
    @board_state_two.move(:o, 4)
    assert_equal @board_state_two.raw, 'o--o----x'
  end

  def test_position_open?
    1.upto(9) { |n| assert @blank_board.position_open?(n) }
    [1, 2, 3, 4, 6, 8].each { |n| assert @board_state_one.position_open?(n) }
    [5, 7, 9].each { |n| refute @board_state_one.position_open?(n) }
  end

  def test_won?
    assert @x_wins_once.won?(:x)
    assert @x_wins_twice.won?(:x)
    assert @x_wins_thrice.won?(:x)
    refute @board_state_one.won?(:x)
    refute @board_state_two.won?(:x)
    assert @o_wins_once.won?(:o)
    assert @o_wins_twice.won?(:o)
    refute @board_state_one.won?(:o)
    refute @board_state_two.won?(:o)
  end

  def test_game_over?
    assert @x_wins_once.game_over?
    assert @x_wins_twice.game_over?
    assert @x_wins_thrice.game_over?
    refute @board_state_one.game_over?
    refute @board_state_two.game_over?
    assert @o_wins_once.game_over?
    assert @o_wins_twice.game_over?
  end

  def test_current_player
    assert_equal @blank_board.current_player, :x
    assert_equal @board_state_two.current_player, :x
    assert_equal @board_state_three.current_player, :o
  end
end
