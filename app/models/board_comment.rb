class BoardComment < ApplicationRecord
  belongs_to :user
  belongs_to :request_boar
end
