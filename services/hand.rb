class Hand
  def initialize(hand)
    raise ArgumentError unless hand == "guu" or hand == "choki" or hand == "paa"
    @hand = hand
  end

  def self.random
    compHand = ["guu", "choki", "paa"].sample
    return Hand.new compHand
  end

  def hand
    return @hand
  end

  def execute(other_hand)
    raise TypeError unless other_hand.is_a? Hand
    other = other_hand.hand
    if hand == other
      return "draw"
    elsif (hand == "guu" && other == "choki") || (hand == "choki" && other == "paa") || (hand == "paa" && other == "guu")
      return "win"
    elsif (hand == "guu" && other == "paa") || (hand == "choki" && other == "guu") || (hand == "paa" && other == "choki")
      return "lose"
    end
  end
end
