class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :instructor
  
  def total_time
    Time.at(self.finish_time - self.begin_time).strftime("%H:%M")
  end
end

