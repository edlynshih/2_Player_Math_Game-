class Game

  def initialize
    @P1= Player.new('Player 1')
    @P2= Player.new('Player 2')
    @current_player = @P1
    @other_player = @P2
  end

  def switch_player
    if @current_player == @P1 
      @current_player = @P2
      @other_player = @P1
    else
      @current_player = @P1
      @other_player = @P2
    end
  end

  def new_turn
    #call method on an instance of class
    question = Question.new

    print ("#{@current_player.name}: ")
    puts(question.generate_question)
    
    #accepts user input
    print "> "
    user_input = $stdin.gets.chomp.to_i

    if question.compare_answers(user_input)
      puts ("✅ YES! You are correct!")
    else
      puts("❌ Wrong! Think harder!")
      # decrease life when player lose
      @current_player.lose_life
    end

    if  @current_player.score == 0
      puts("🎉 #{@other_player.name} wins with a score of #{@other_player.score}/3 🎉")
      puts("---- GAME OVER ----")
      puts("Good bye!")
    else
      puts("#{@current_player.name}: #{@current_player.score}/3 vs #{@other_player.name}: #{@other_player.score}/3")
      puts("---- NEW TURN ----")
      switch_player
    end
  end

  #generates questions as long as player score is above 0
  def start
    while @current_player.score > 0
      new_turn
    end
  end
  
end