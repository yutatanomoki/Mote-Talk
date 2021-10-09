class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :instructor

  def total_time
    Time.at(finish_time - begin_time).strftime("%H:%M")
  end
end
