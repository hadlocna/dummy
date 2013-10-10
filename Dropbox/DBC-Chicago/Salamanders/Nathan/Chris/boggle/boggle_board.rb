class BoggleBoard
  def initialize
    @board = Array.new(4) { Array.new(4) {"_"}   }
@die_arr = []
@die_arr << "AAEEGN".split('')
@die_arr << "ELRTTY".split('')
@die_arr << "AOOTTW".split('')
@die_arr << "ABBJOO".split('')
@die_arr << "EHRTVW".split('')
@die_arr << "CIMOTU".split('')
@die_arr << "DISTTY".split('')
@die_arr << "EIOSST".split('')
@die_arr << "DELRVY".split('')
@die_arr << "ACHOPS".split('')
@die_arr << "HIMNQU".split('')
@die_arr << "EEINSU".split('')
@die_arr << "EEGHNW".split('')
@die_arr << "AFFKPS".split('')
@die_arr << "HLNNRZ".split('')
@die_arr << "DEILRX".split('')

  end
  #LETTERS = ("A".."Z").to_a
  


  def shake!
    #@board.map! {|row| row.map!{|square| square = LETTERS[rand(26)]}}

    @die_arr.each {|die| die.shuffle!}
    @die_arr.shuffle.each_with_index {|die, index| 
      die[0] = "Qu" if die[0] == "Q"
      @board[index / 4][index % 4] = die[0] }

  end
  
  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  #
  # Override this to print out a sensible board format so
  # you can write code like:
  #
  # board = BoggleBoard.new
  # board.shake!
  # puts board
  def to_s
    @board.each {|row| p row}
  end
end





board = BoggleBoard.new
puts board
board.shake!
puts board

