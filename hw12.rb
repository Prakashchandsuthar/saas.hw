
class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  
  strategies = {
    'r' => lambda { |other| other == 'p' ? game[1] : game[0] },
    'p' => lambda { |other| other == 's' ? game[1] : game[0] },
    's' => lambda { |other| other == 'r' ? game[1] : game[0] }
  }
  strategy1 = game[0][1].downcase
  strategy2 = game[1][1].downcase
  
  [strategy1, strategy2].each {
    |strategy|
      raise NoSuchStrategyError unless strategies.count { |k,v| k == strategy } > 0
  }
  
  strategies[strategy1].call(strategy2)
end

#2b
def rps_tournament_winner(tournament)
  def roundWinners(tournament)
    roundWinners = []
    tournament.each {
      |roundGame|
        winner1 = rps_game_winner(roundGame[0])
        winner2 = rps_game_winner(roundGame[1])
        roundWinners.push(rps_game_winner([winner1, winner2]))
    }
    roundWinners
  end
  
  def finalWinner(players)
    if players.count < 2
      return players[0]
    end
    
    winners = []
    0.step(players.count - 1, 2) {
      |i|
        game = [players[i], players[i+1]]
        winners.push(rps_game_winner(game))
    }
    finalWinner(winners)
  end
  
  finalWinner(roundWinners(tournament))
end




