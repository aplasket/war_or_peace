require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


RSpec.describe Turn do
  it "exists" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10) 
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)  
    card5 = Card.new(:heart, '8', 8) 
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)  
    card8 = Card.new(:diamond, '2', 2) 

    deck1 = Deck.new([card1, card2, card5, card8]) 
    deck2 = Deck.new([card3, card4, card6, card7])    

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2) 

    expect(turn).to be_an_instance_of(Turn)
  end

  it "has players" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10) 
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)  
    card5 = Card.new(:heart, '8', 8) 
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)  
    card8 = Card.new(:diamond, '2', 2) 

    deck1 = Deck.new([card1, card2, card5, card8]) 
    deck2 = Deck.new([card3, card4, card6, card7])    

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2) 
   
    expect(turn.player1).to eq(player1)
    expect(turn.player2).to eq(player2)
  end

  it "has a basic type" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10) 
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)  
    card5 = Card.new(:heart, '8', 8) 
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)  
    card8 = Card.new(:diamond, '2', 2) 

    deck1 = Deck.new([card1, card2, card5, card8]) 
    deck2 = Deck.new([card3, card4, card6, card7])    

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:basic)
  end

  it "has a winner for basic turn" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10) 
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)  
    card5 = Card.new(:heart, '8', 8) 
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)  
    card8 = Card.new(:diamond, '2', 2) 

    deck1 = Deck.new([card1, card2, card5, card8]) 
    deck2 = Deck.new([card3, card4, card6, card7])    

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)
    winner = turn.winner
 
    expect(turn.type).to eq(:basic)
    expect(winner).to eq(player1)

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10) 
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)  
    card5 = Card.new(:heart, '8', 8) 
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)  
    card8 = Card.new(:diamond, '2', 2) 

    deck1 = Deck.new([card1, card2, card5, card8]) 
    deck2 = Deck.new([card6, card4, card3, card7])    

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)
    winner = turn.winner
 
    expect(turn.type).to eq(:basic)
    expect(winner).to eq(player2)
  end

  it "has player 2 winner for war turn" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10) 
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)  
    card5 = Card.new(:heart, '8', 8) 
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)  
    card8 = Card.new(:diamond, '2', 2) 

    deck1 = Deck.new([card1, card2, card5, card8]) 
    deck2 = Deck.new([card4, card3, card6, card7])    

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)
    winner = turn.winner
 
    expect(turn.type).to eq(:war)
    expect(winner).to eq(player2)
  end

  it "has player1 as winner for war" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10) 
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)  
    card5 = Card.new(:heart, '8', 8) 
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)  
    card8 = Card.new(:diamond, '2', 2) 

    deck1 = Deck.new([card1, card2, card5, card8]) 
    deck2 = Deck.new([card4, card3, card7, card6])    

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)
    winner = turn.winner

    expect(turn.type).to eq(:war)
    expect(winner).to eq(player1)
  end

  it "has no winner" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10) 
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)  
    card5 = Card.new(:heart, '8', 8) 
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)  
    card8 = Card.new(:diamond, '2', 2) 
    card9 = Card.new(:heart, '2', 2)
    card10 = Card.new(:spade, '10', 10)

    deck1 = Deck.new([card1, card2, card8, card5, card10]) 
    deck2 = Deck.new([card4, card3, card9, card6, card7])    

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)
    winner = turn.winner

    expect(turn.type).to eq(:mutually_assured_destruction)
    expect(winner).to eq("no winner")
  end

  it "piles cards" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10) 
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)  
    card5 = Card.new(:heart, '8', 8) 
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)  
    card8 = Card.new(:diamond, '2', 2) 

    deck1 = Deck.new([card1, card2, card5, card8]) 
    deck2 = Deck.new([card3, card4, card6, card7])    

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)

    turn.type
    turn.pile_cards
    
    expect(turn.spoils_of_war).to eq([card1, card3])
  end

  it "awards spoils to basic winner" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10) 
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)  
    card5 = Card.new(:heart, '8', 8) 
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)  
    card8 = Card.new(:diamond, '2', 2) 

    deck1 = Deck.new([card1, card2, card5, card8]) 
    deck2 = Deck.new([card3, card4, card6, card7])    

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)
    
    turn.type 
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    expect(winner).to eq(player1)
    expect(winner.deck.cards).to eq([card2, card5, card8, card1, card3])

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10) 
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)  
    card5 = Card.new(:heart, '8', 8) 
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)  
    card8 = Card.new(:diamond, '2', 2) 

    deck1 = Deck.new([card8, card2, card5, card1]) 
    deck2 = Deck.new([card3, card4, card6, card7])    

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)
    
    turn.type 
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    expect(winner).to eq(player2)
    expect(winner.deck.cards).to eq([card4, card6, card7, card8, card3])
  end

  it "awards spoils to war winner" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10) 
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)  
    card5 = Card.new(:heart, '8', 8) 
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)  
    card8 = Card.new(:diamond, '2', 2) 

    deck1 = Deck.new([card1, card2, card5, card8]) 
    deck2 = Deck.new([card4, card3, card6, card7])    

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    

    turn = Turn.new(player1, player2)
  
    turn.type
    winner = turn.winner
    turn.pile_cards
   
    turn.award_spoils(winner)
    
    expect(winner).to eq(player2)
    expect(winner.deck.cards).to eq([card7,card1, card2, card5,card4, card3, card6,])
  end
end