# Combine all

class World
    attr_accessor :name, :party, :politics
    @@pol_arr = []
    @@per_arr = []
end

# Define politician and party 

class Politician < World
    def initialize(name, party)
        @name = name.capitalize
        @party = party.capitalize
        @@pol_arr << self
    end

    def self.all 
        @@pol_arr
    end
end


# Define person/voter and politics

class Citizen < World
    def initialize(name, politics)
        @name = name.capitalize
        @politics = politics.capitalize
        @@per_arr << self
    end

    def self.all
        @@per_arr
    end
end
