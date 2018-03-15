class Hangman

  def initialize
    @player = "potato"
    @secret_word = select_word
    @display_content = "_" * @secret_word.length
    @failed_attemps = 0
  end

  def main_menu
  	#load or new game?
  end
  
  def start_game
  	player_won = false
  	while @failed_attemps != 10 
  	  puts "#{10 - @failed_attemps} turns left" 
      print "Enter a letter or attempt the full word: "
      letters = gets.chomp
      #save_state if letters == "save"
      break if letters == "exit"
      update_display(letters) if letters
      puts @display_content
      player_won = player_won?
      break if player_won
    end
    puts "Game over, the secret word was: #{@secret_word}" if !player_won
  end

  private

  def select_word
    words = File.readlines("5desk.txt").select { |word| word.length.between?(5, 12) }
    words[rand(words.length)].strip
  end

  def update_display(letters)
    letters.downcase!
    current_state = "#{@display_content}"
    if letters.length == 1
      @display_content.length.times do |index|
        @display_content[index] = letters if @secret_word[index].downcase == letters
      end
    else
      @display_content = letters if letters == @secret_word.downcase
    end

    current_state == @display_content ? print_toon(1) : print_toon(0)
  end

  def save_state
    #hurr durr to json
  end
  
  def load_state
  	#json to hurr durr
  end

  def player_won?
  	unless @display_content.include?("_")
      puts "You found the correct word!"
      true
    end
  end

  def print_toon(increment)
  	@failed_attemps += increment

  	case @failed_attemps
  	when 0
      puts "  ______"
      puts "        |"
      puts "        |"
      puts "        |"
      puts "        |"
    when 1
      puts "  ______"
      puts " |      |"
      puts "        |"
      puts "        |"
      puts "        |"
    when 2
      puts "  ______"
      puts " |      |"
      puts "(oo)    |"
      puts "        |"
      puts "        |"
    when 3
      puts "  ______"
      puts " |      |"
      puts "(oo)    |"
      puts " |      |"
      puts "        |"
    when 4
      puts "  ______"
      puts " |      |"
      puts "(oo)    |"
      puts " ||     |"
      puts "        |"  
    when 5
      puts "  ______"
      puts " |      |"
      puts "(oo)    |"
      puts "/||     |"
      puts "        |"
    when 6
      puts "  ______"
      puts " |      |"
      puts "(oo)    |"
      puts "/||\\    |"
      puts "        |"
    when 7
      puts "  ______"
      puts " |      |"
      puts "(oo)    |"
      puts "/||\\    |"
      puts "/       |"
    when 8
      puts "  ______"
      puts " |      |"
      puts "(oo)    |"
      puts "/||\\    |"
      puts "/  \\    |"
    when 9
      puts "  ______"
      puts " |      |"
      puts "(ox)    |"
      puts "/||\\    |"
      puts "/  \\    |"  
    when 10
      puts "  ______"
      puts " |      |"
      puts "(xx)    |"
      puts "/||\\    |"
      puts "/  \\    |"           
    end
    puts ""
  end

end

my_game = Hangman.new
my_game.start_game