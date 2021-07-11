WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_TO_MOVE = 'choose'

def prompt(msg)
  puts "=> #{msg}"
end

def valid_choice?(input)
  if input.downcase == 'player' || input.downcase == 'computer'
    true
  else
    false
  end
end

def joinor(array, delimiter = ',', word = 'or')
  case array.length
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{word} ")
  else
    array[-1] = "#{word} #{array.last}"
    array.join(delimiter)
  end
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if brd.keys.select { |num| brd[num] == ' ' }.include?(square)

    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def find_computer_move(marker, line, brd)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |key, value| line.include?(key) && value == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_computer_move(COMPUTER_MARKER, line, brd)
    break if square
  end

  unless square
    WINNING_LINES.each do |line|
      square = find_computer_move(PLAYER_MARKER, line, brd)
      break if square
    end
  end

  unless square
    square = empty_squares(brd).sample
    square = 5 if brd[5] == ' '
  end

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, curr_player)
  if curr_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(curr_player)
  curr_player == 'player' ? 'computer' : 'player'
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

loop do
  player_score = 0
  computer_score = 0
  current_player = ''
  system 'clear'
  puts 'Welcome to Tic Tac Toe!'

  loop do
    board = initialize_board

    if FIRST_TO_MOVE == 'choose'
      loop do
        prompt "Please choose who is the first to act ('player' or 'computer')"
        choice = gets.chomp
        if valid_choice?(choice)
          current_player = choice
          break
        else
          prompt "Invalid choice! Please choose 'player' or 'computer'"
          next
        end
      end
    else
      current_player = FIRST_TO_MOVE
    end

    loop do
      display_board(board)
      sleep(0.4)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      if detect_winner(board) == 'Player'
        player_score += 1
      else
        computer_score += 1
      end
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    puts "Player : #{player_score}  Computer : #{computer_score}"
    prompt 'Press Enter to continue'
    gets.chomp

    if player_score == 5
      prompt 'The Player is the final winner!'
      break
    elsif computer_score == 5
      prompt 'The Computer is the final winner!'
      break
    end
  end
  prompt 'Play again? (y or n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe! Goodbye!'
