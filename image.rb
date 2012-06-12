class Image
  attr_accessor :win_percentage, :battles, :avg_score_of_wins, :id
  @@count = 1
  
  def initialize
    @battles = rand(1..100)
    wins = rand(1..@battles)
    @win_percentage = wins.to_f / @battles.to_f
    @avg_score_of_wins = rand(0.00..0.9)
    @id = @@count
    @@count += 1
  end
  
  def win(competitor)
    @avg_score_of_wins = ((self.total_wins * @avg_score_of_wins) + competitor.score) / (self.total_wins + 1)
    @win_percentage = (self.total_wins + 1) / self.add_a_battle
    competitor.lose
    self.conf
  end
  
  def lose
    @win_percentage = (self.total_wins) / self.add_a_battle
    self.conf
  end
  
  def conf
    self.ci_lower_bound(self.total_wins, @battles)
  end
  
  def score
    self.conf
  end
  
  def weighted_score
    self.conf * @avg_score_of_wins * 100
  end
  
  def total_wins
    @win_percentage * @battles
  end
  
  def add_a_battle
    @battles += 1
  end
  
  def ci_lower_bound(wins, battles)
      return 0 if battles == 0
      
      # Targeting 95% confidence
      z_score = 1.96
      x = wins.to_f/battles.to_f
      (x + z_score*z_score/(battles*2) - z_score * Math.sqrt((x*(1-x)+z_score*z_score/(battles*4))/battles))/(1+z_score*z_score/battles)
  end
end
