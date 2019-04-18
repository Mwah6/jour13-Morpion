
class Show

  def initialize
  end
  def show_board(boardcases)
    puts
    puts "  ▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀ "
    puts "  ▀▄           ▀▄           ▀▄           ▀▄ "
    puts "  ▀▄     #{boardcases[6].value}     ▀▄     #{boardcases[7].value}     ▀▄     #{boardcases[8].value}     ▀▄ "
    puts "  ▀▄           ▀▄           ▀▄           ▀▄ "
    puts "  ▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀ "
    puts "  ▀▄           ▀▄           ▀▄           ▀▄ "
    puts "  ▀▄     #{boardcases[3].value}     ▀▄     #{boardcases[4].value}     ▀▄     #{boardcases[5].value}     ▀▄ "
    puts "  ▀▄           ▀▄           ▀▄           ▀▄ "
    puts "  ▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀ "
    puts "  ▀▄           ▀▄           ▀▄           ▀▄ "
    puts "  ▀▄     #{boardcases[0].value}     ▀▄     #{boardcases[1].value}     ▀▄     #{boardcases[2].value}     ▀▄ "
    puts "  ▀▄           ▀▄           ▀▄           ▀▄ "
    puts "  ▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀ "
    puts
  end


end
