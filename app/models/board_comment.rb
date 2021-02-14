class BoardComment < ApplicationRecord
  belongs_to :instructor
  belongs_to :request_board
end
