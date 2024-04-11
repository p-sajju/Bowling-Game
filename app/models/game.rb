class Game < ApplicationRecord

  # Method to calculate the total score of the game
	def score
    total_score = 0
    roll_index = 0

    # Loop through each frame of the game (10 frames)
    10.times do 
      if strike?(roll_index) # it's a strike
        total_score += strike_bonus(roll_index)
        roll_index += 1
      elsif spare?(roll_index) # it's a sspare
        total_score += spare_bonus(roll_index)
        roll_index += 2
      else  # If it's neither a strike nor a spare
        total_score += frame_score(roll_index)
        roll_index += 2
      end
    end

    total_score # Return the total score of the game
  end

  private

  # Method to check if the current frame is a strike
  def strike?(roll_index)
    rolls[roll_index].to_i == 10
  end

  # Method to check if the current frame is a spare
  def spare?(roll_index)
    rolls[roll_index].to_i + rolls[roll_index + 1].to_i == 10
  end

  # Method to calculate bonus points for a strike
  def strike_bonus(roll_index)
    rolls[roll_index].to_i + rolls[roll_index + 1].to_i + rolls[roll_index + 2].to_i
  end

  # Method to calculate bonus points for a spare
  def spare_bonus(roll_index)
    rolls[roll_index].to_i + rolls[roll_index + 1].to_i + rolls[roll_index + 2].to_i
  end

  # Method to calculate the score of a frame
  def frame_score(roll_index)
    rolls[roll_index].to_i + rolls[roll_index + 1].to_i
  end
end
