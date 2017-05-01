class Report
  attr_accessor :user, :group, :peer_evals, :group_evals

  def average_goals
    @avg1 = self.peer_evals.average(:goals)
  end

  def average_quality
    @avg2 = self.peer_evals.average(:quality)
  end

  def average_effort
    @avg3 = self.peer_evals.average(:effort)
  end

  def average_considerate
    @avg4 = self.peer_evals.average(:considerate)
  end

  def average_knowledge
    @avg5 = self.peer_evals.average(:knowledge)
  end

  def average_sharing
    @avg6 = self.peer_evals.average(:sharing)
  end

  def overall_pct
    overall = @avg1 + @avg2 + @avg3 + @avg4 + @avg5 + @avg6
    overall = overall / 6 
    overall = overall / 4 * 100
  end

end
