require './voter_simulation'

class VoteTest
  def create_politician
    new_candidate = Politician.new("ray", "cylon")
  end

  def create_person
    new_person = Person.new("braaf", "neutral")
  end
end





Test = VoteTest.new
p Test.create_politician
p Test.create_person