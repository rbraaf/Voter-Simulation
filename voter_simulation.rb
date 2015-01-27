# Combine all

class World
    attr_accessor :name
    def initialize(name)
        @name = name.capitalize
    end
    @@pol_arr = []
    @@per_arr = []
    @@repvotes = []
    @@demvotes = []
end

# Define politician and party 

class Politician < World
    attr_accessor :party
    def initialize(name, party)
        super(name)
        @party = party.capitalize
        @@pol_arr << self
    end

    def self.all 
        @@pol_arr
    end

    def visit_voters
        Politician.all.each do |visit|
        puts "I'm #{pol.name} and I approve this message"
        end
    end

    def self.sample_politicians
        Politician.new("charlie christ", "democrat")
        Politician.new("rick scott", "republican")
    end
end

# Define person/voter and politics

class Citizen < World
    attr_accessor :politics
    def initialize(name, politics)
        super(name)
        @politics = politics.capitalize
        @@per_arr << self
    end

    def self.all
        @@per_arr
    end

    def self.sample_citizens
        Citizen.new("braaf", "Neutral")
        Citizen.new("bruce banner", "Liberal")
        Citizen.new("hank pym", "Socialist")
        Citizen.new("ulton", "Tea Party")
    end

    def self.repvotes
        @@repvotes
    end

    def self.demvotes
        @@demvotes
    end

end
