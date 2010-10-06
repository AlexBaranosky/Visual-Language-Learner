
module Enumerable
  def pick_randomly
    sort_by { rand }.first
  end
end