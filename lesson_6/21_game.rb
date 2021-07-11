# frozen_string_literal: true

MAX_VALUE = 21
DEALER_STAY = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  cards = []

  %w[H C D S].each do |suit|
    %w[A 2 3 4 5 6 7 8 9 10 J Q K].each do |value|
      cards << [suit, value]
    end
  end

  cards
end

def deal_initial_cards(deck)
  deck.shift(2)
end

def total(cards)
  total = 0

  values = cards.map { |card| card[1] }

  values.each do |value|
    total += if value == 'A'
               11
             elsif value.to_i.zero?
               10
             else
               value.to_i
             end
  end

  values.select { |value| value == 'A' }.count.times do
    total -= 10 if total > MAX_VALUE
  end

  total
end

def display_hand(hand)
  cards = hand.map { |_suit, value| value }

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

def display_result(player_hand, dealer_hand, points)
  result = detect_result(player_hand, dealer_hand)

  case result
  when :player_busted
    points[:dealer] += 1
    prompt 'Too many!  Dealer wins!'
  when :dealer_busted
    points[:player] += 1
    prompt 'Dealer busts! You win!'
  when :player
    points[:player] += 1
    prompt 'You win!'
  when :dealer
    points[:dealer] += 1
    prompt 'Dealer wins!'
  when :tie
    prompt "It's a tie!"
  end
end

def display_score(points)
  puts '---------------------------------'
  prompt 'First to 5 points is the winner!'
  prompt "Player Points : #{points[:player]}    Dealer Points: #{points[:dealer]}"
  prompt '(Hit Enter key to continue)'
  gets
end

def play_again?(points)
  points[:player] < 5 && points[:dealer] < 5
end

points = { player: 0, dealer: 0 }

loop do
  deck = initialize_deck.shuffle

  player_hand = deal_initial_cards(deck)
  dealer_hand = deal_initial_cards(deck)

  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  loop do
    answer = nil

    loop do
      system 'clear'
      prompt "Dealer has: #{dealer_hand[0][1]} and unknown card"
      prompt "You have: #{display_hand(player_hand)}"
      puts
      puts "   Dealer: Unknown   Player: #{player_total}"
      puts '---------------------------------'
      prompt '(h)it or (s)tay?'
      answer = gets.chomp.downcase
      break if %w[h s].include?(answer)
    end

    if answer == 'h'
      hit(player_hand, deck)
      player_total = total(player_hand)
      prompt "You drew a #{player_hand.last[1]}, for a total of #{player_total}."
      sleep 2
    end

    break if answer == 's' || busted?(player_hand)
  end

  if busted?(player_hand)
    display_result(player_hand, dealer_hand, points)
    display_score(points)
    play_again?(points) ? next : break
  else
    prompt 'You chose to stay!'
    sleep 2
  end

  first_show = true

  loop do
    system 'clear'
    prompt "Dealer has: #{display_hand(dealer_hand)}"
    prompt "You have: #{display_hand(player_hand)}"
    puts
    puts "   Dealer: #{dealer_total}        Player: #{player_total}"
    puts '---------------------------------'
    if first_show == true
      prompt "Dealer shows a total of #{dealer_total}!"
      sleep 2
    end

    break if dealer_total >= DEALER_STAY || busted?(dealer_hand)

    hit(dealer_hand, deck)
    dealer_total = total(dealer_hand)
    prompt "The dealer drew a #{dealer_hand.last[1]}, for a total of #{dealer_total}."
    first_show = false
    sleep 2
  end

  display_result(player_hand, dealer_hand, points)
  display_score(points)

  break unless play_again?(points)
end

case points[:player] <=> points[:dealer]
when  1 then puts 'Congratulations! You are the Champion!'
when -1 then puts 'Sorry :( The house always wins...'
end
