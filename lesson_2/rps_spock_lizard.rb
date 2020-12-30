VALID_CHOICES = %w(rock paper scissors spock lizard)
short_names = { r: 'rock', p: 'paper', sc: 'scissors',
                sp: 'spock', l: 'lizard' }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  win_table = { rock: ['lizard', 'scissors'],
                paper: ['rock', 'spock'],
                scissors: ['paper', 'lizard'],
                spock: ['rock', 'scissors'],
                lizard: ['spock', 'paper'] }

  win_table[first.to_sym].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  prompt("Welcome to the game! First to five wins!")
  player_score = 0
  computer_score = 0

  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      prompt("Short hand accepted : r, p , sc, sp, l")
      choice = Kernel.gets().chomp()

      if short_names.key?(choice.to_sym) || VALID_CHOICES.include?(choice)
        choice = short_names[choice.to_sym]
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_result(choice, computer_choice)

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end

    if player_score == 5
      prompt("You've won five matches! You are the grand winner!")
      break
    elsif computer_score == 5
      prompt("I'm sorry. The computer has won five matches. You lose.")
      break
    end
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
