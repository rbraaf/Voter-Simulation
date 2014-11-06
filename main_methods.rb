module MainMethods

def start
  puts "What would you like to do? Create, List, Update, or Vote?"
  answer = gets.chomp.downcase
  case answer
  when "create"
    create() # Done 
  when "list"
    list() # Done
  when "update"
    update() # Done
  when "vote"
    vote()
  end
end



def create
  puts "What would you like to create? Politician or Person?"
  create = gets.chomp
  if create == "politician"
    create_politician
  elsif create == "person"
    create_voter
  else
    puts "Please choose Politician or Person"
  end
end


def create_politician
  puts "Name?"
  name = gets.chomp.downcase
  puts "Party? Democrat or Republican?"
  party = gets.chomp.downcase
  Politician.new(name, party)
end

def create_voter
  puts "Name?"
  name = gets.chomp.downcase
  puts "Politics? Liberal, Conservative, Tea Party, Socialist, or Neutral?"
  politics = gets.chomp.downcase
  Citizen.new(name, politics)
end


def list
  Politician.all.each do |pol|
    pol.name = pol.name.split.map {|i| i.capitalize}.join(' ') 
    puts "Politician, #{pol.name}, #{pol.party.capitalize}"
  end
  Citizen.all.each do |per|
    per.name = per.name.split.map {|i| i.capitalize}.join(' ')
    puts "Voter, #{per.name}, #{per.politics}"
  end
end



def update
  puts "Name?"
  name = gets.chomp.downcase
  puts "Change name? Change party? Change Politics?"
  result = gets.chomp.downcase
  if result == "name"
    change_name(name)
  elsif result == "party"
    change_party(name)
  elsif result == "politics"
    change_politics(name)
  else
    puts "Invalid entry"
    update
  end
end



def change_name old_name
    puts "Please enter new name"
    new_name = gets.chomp
      
    Politician.all.each do |pol|
      if old_name == pol.name.downcase
        pol.name = new_name
      end
    end

    Citizen.all.each do |cit|
      if old_name == cit.name.downcase
        cit.name = new_name
      end
    end
end



def change_party old_name
  puts "Please enter new party"
  new_party = gets.chomp.downcase
    Politician.all.each do |pol|
      if old_name == pol.name.downcase
        pol.party = new_party
      end
    end
end



def change_politics old_name
  puts "Please enter new politics"
  new_politics = gets.chomp.downcase
    Citizen.all.each do |cit|
      if old_name == cit.name.downcase
        cit.party = new_politics
      end
    end
end

end
