class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @game_over = false
    @sequence_length = 1
    play
  end

  def play
    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if @game_over == false
      self.round_success_message
      @sequence_length += 1
    else
      game_over_message
      reset_game
    end

  end

  def show_sequence
    add_random_color
    # system("clear")
    seq.each do |chr|
      system("clear")
      puts chr
      sleep(2)
      system("clear")
    end
    puts "What whas the code:"
  end

  def require_sequence
    input = gets.chomp.split(" ")
    puts input
    if input != seq
      @game_over = true
    end

    #The goal of require_sequence is to prompt the user to repeat back the new sequence that was just shown to them, one color at a time. If they give an incorrect color, it should immediately set @game_over to be true
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    system("clear")
    puts "good job"
    sleep(2)
  end

  def game_over_message
    puts "Oops, that was wrong idiot"
    sleep(2)
    puts "Start Again"
    sleep(2)

  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    play
  end
end


if $PROGRAM_NAME == __FILE__
  # running as script
    Simon.new

end
