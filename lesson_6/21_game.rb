# frozen_string_literal: true

MAX_VALUE = 21
DEALER_STAY = 17
WINNING_SCORE = 5
SUITS = %w[Hearts Clubs Diamonds Spades].freeze
FACE_VALUES = %w[Ace 2 3 4 5 6 7 8 9 10 Jack Queen King].freeze

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  cards = []

  SUITS.each do |suit|
    FACE_VALUES.each do |value|
      cards << { suit: suit, value: value }
    end
  end

  cards
end

def deal_initial_cards(deck)
  deck.shift(2)
end

def ace_value_adjustment(values, total)
  values.select { |value| value == 'Ace' }.count.times do
    total -= 10 if total > MAX_VALUE
  end

  total
end

def total(cards)
  total = 0

  values = cards.map { |card| card[:value] }

  values.each do |value|
    total += if value == 'Ace'
               11
             elsif value.to_i.zero?
               10
             else
               value.to_i
             end
  end

  ace_value_adjustment(values, total)
end

def display_hand(hand)
  cards = hand.map { |card| "#{card[:value]} of #{card[:suit]}" }

  if cards.length == 2
    cards.join(' and ')
  else
    cards[-1] = "and #{cards.last}"
    cards.join(', ')
  end
end

def busted?(hand)
  total(hand) > MAX_VALUE
end

def hit(hand, deck)
  hand << deck.shift
end

def player_turn_display(player_hand, dealer_hand, player_total)
  prompt "Dealer has: #{dealer_hand[0][:value]} of "\
    "#{dealer_hand[0][:suit]} and Unknown Card"
  prompt "You have: #{display_hand(player_hand)}"
  puts
  puts "   Dealer: Unknown   Player: #{player_total}"
  puts '---------------------------------'
end

def dealer_turn_display(player_hand, dealer_hand, player_total, dealer_total)
  prompt "Dealer has: #{display_hand(dealer_hand)}"
  prompt "You have: #{display_hand(player_hand)}"
  puts
  puts "   Dealer: #{dealer_total}        Player: #{player_total}"
  puts '---------------------------------'
end

def player_hit(player_hand, deck)
  hit(player_hand, deck)
  player_total = total(player_hand)
  prompt "You drew a #{player_hand.last[:value]} of "\
    "#{player_hand.last[:suit]}, for a total of #{player_total}."
  sleep 3
end

def dealer_hit(dealer_hand, deck)
  hit(dealer_hand, deck)
  dealer_total = total(dealer_hand)
  prompt "The dealer drew a #{dealer_hand.last[:value]} of "\
    "#{dealer_hand.last[:suit]} for a total of #{dealer_total}."
  sleep 3
end

def player_decision(player_hand, dealer_hand, player_total)
  answer = nil

  loop do
    system 'clear'
    player_turn_display(player_hand, dealer_hand, player_total)

    prompt '(h)it or (s)tay?'
    answer = gets.chomp.downcase
    return answer if %w[h s].include?(answer)

    prompt "Invalid input. Please enter 'h' or 's'."
    sleep 2
  end
end

def player_turn(player_hand, dealer_hand, deck)
  loop do
    player_total = total(player_hand)

    answer = player_decision(player_hand, dealer_hand, player_total)

    player_hit(player_hand, deck) if answer == 'h'

    break if answer == 's' || busted?(player_hand)
  end
end

def dealer_turn(player_hand, dealer_hand, deck)
  first_show = true
  player_total = total(player_hand)

  loop do
    dealer_total = total(dealer_hand)

    system 'clear'
    dealer_turn_display(player_hand, dealer_hand, player_total, dealer_total)

    if first_show == true
      prompt "Dealer shows a total of #{dealer_total}!"
      sleep 2
    end

    break if dealer_total >= DEALER_STAY || busted?(dealer_hand)

    dealer_hit(dealer_hand, deck)
    first_show = false
  end
end

def detect_result(player_hand, dealer_hand)
  dealer_total = total(dealer_hand)
  player_total = total(player_hand)

  if player_total > MAX_VALUE
    :player_busted
  elsif dealer_total > MAX_VALUE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def track_score(result, points)
  case result
  when :player_busted, :dealer
    points[:dealer] += 1
  when :dealer_busted, :player
    points[:player] += 1
  end
end

def display_result(player_hand, dealer_hand, points)
  result = detect_result(player_hand, dealer_hand)
  track_score(result, points)

  case result
  when :player_busted
    prompt 'Too many!  Dealer wins!'
  when :dealer_busted
    prompt 'Dealer busts! You win!'
  when :player
    prompt 'You win!'
  when :dealer
    prompt 'Dealer wins!'
  when :tie
    prompt "It's a tie!"
  end
end

def display_score(points)
  puts '---------------------------------'
  prompt 'First to 5 points is the winner!'
  prompt "Player Points : #{points[:player]}    "\
    "Dealer Points: #{points[:dealer]}"
  prompt '(Hit Enter key to continue)'
  gets
end

def another_round?(points)
  points[:player] < WINNING_SCORE &&
    points[:dealer] < WINNING_SCORE
end

def play_again?
  loop do
    puts '---------------------------------'
    prompt 'Would you like to play again? (Y/N)?'
    answer = gets.chomp

    return true if answer.downcase == 'y'
    break if answer.downcase == 'n'

    prompt "Invalid input. Please enter 'y' or 'n'."
  end

  false
end

system 'clear'
puts '<<<<   Welcome to the game of 21!   >>>>'
puts '========================================'
prompt "Press 'Enter' to begin the game"
gets

loop do
  points = { player: 0, dealer: 0 }

  loop do
    deck = initialize_deck.shuffle

    player_hand = deal_initial_cards(deck)
    dealer_hand = deal_initial_cards(deck)

    player_turn(player_hand, dealer_hand, deck)

    if busted?(player_hand)
      display_result(player_hand, dealer_hand, points)
      display_score(points)
      another_round?(points) ? next : break
    else
      prompt 'You chose to stay!'
      sleep 2
    end

    dealer_turn(player_hand, dealer_hand, deck)

    display_result(player_hand, dealer_hand, points)
    display_score(points)

    break unless another_round?(points)
  end

  case points[:player] <=> points[:dealer]
  when  1 then puts 'Congratulations! You are the Champion!'
  when -1 then puts 'Sorry :( The house always wins...'
  end

  break unless play_again?
end
