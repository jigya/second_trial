class ProblemInContest < ActiveRecord::Base
  belongs_to :problem
  belongs_to :contest
end
