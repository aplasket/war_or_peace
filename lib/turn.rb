class Turn
  attr_reader :player1, :player2, :spoils_of_war, :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    
    def type
      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
          turn = :mutually_assured_destruction
      elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
        turn = :war
      else
        turn = :basic
      end
    end
  end

  def winner
    if type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      winner = player1

    elsif type == :basic && player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      winner = player2
      
    elsif type == :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      winner = player1
    
    elsif type == :war && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
      winner = player2

    elsif type == :mutually_assured_destruction
      winner = "No Winner"
    end
  end

  def pile_cards
      if type == :basic 
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      elsif type == :war
        3.times { @spoils_of_war << player1.deck.remove_card }
        3.times { @spoils_of_war << player2.deck.remove_card }
      elsif type == :mutually_assured_destruction
        3.times { player1.deck.remove_card }
        3.times { player2.deck.remove_card }
      end
  end

  def award_spoils(winner)
    if winner == player1 || winner == player2
      (winner.deck.cards << @spoils_of_war).flatten!
    end
  end

end
