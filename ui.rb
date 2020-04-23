class UI
  class << self
    def output(board)
      set_vars(board)

      <<~OUTPUT
      #{message}

       #{letters(0)} │ #{letters(1)} │ #{letters(2)}
      ───┼───┼───
       #{letters(3)} │ #{letters(4)} │ #{letters(5)}
      ───┼───┼───
       #{letters(6)} │ #{letters(7)} │ #{letters(8)}
      OUTPUT
    end

    private

    def set_vars(board)
      @board = board
    end

    def message
      unless @board.game_over?
        "Turn: Player #{@board.current_player.upcase}"
      else
        "Game Over\nPlayer #{@board.winner.upcase} won!"
      end
    end

    def letters(n)
      @board.raw.gsub('-', ' ').upcase.chars[n]
    end
  end
end
