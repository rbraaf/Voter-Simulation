require './voter_simulation'

class VoteTest
  def create_politician
    ray = Politician.new("ray", "Democrat")
    tony_strak = Politician.new("tony stark", "Democrat")
    steve_rogers = Politician.new("steve rogers", "Republican")
    thor = Politician.new("thor", "Republican")
  end

  def create_citizen
    braaf = Citizen.new("braaf", "neutral")
    banner = Citizen.new("bruce banner", "Liberal")
    pym = Citizen.new("hank pym", "socialist")
  end
end





Test = VoteTest.new
p Test.create_politician
p Test.create_citizen