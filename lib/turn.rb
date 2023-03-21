class Turn
  attr_reader :player1, :player2

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
    if turn = :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      winner = player1

    elsif turn = :basic && player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      winner = player2
      
    elsif turn = :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      winner = player1
    
    elsif turn = :war && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
      winner = player2

    else turn = :mutually_assured_destruction
      winner = nil
    end


  end

end
