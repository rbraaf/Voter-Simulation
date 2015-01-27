module MainMethods

  def start
    process = 0
    until process == 1
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
        process += 1
      when "sample"
        Citizen.sample_citizens
        Politician.sample_politicians
      else
        start
      end
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


def vote
  puts "The polls are open!"
  start_campaign
  polling
  define_winner
end


def start_campaign
  Politician.all.each do |politician|
    Citizen.all.each do |citizen|
      puts "Vote for #{politician.name}"
    end
  end
end


def polling
  Citizen.all.each do |citizen|
    if citizen.politics.downcase == "tea party"
      if (1 + rand(100)) > 10
        Citizen.repvotes.push citizen.name
      else
        Citizen.demvotes.push citizen.name
      end
    elsif citizen.politics.downcase == "conservative"
      if (1 + rand(100)) > 25
        Citizen.repvotes.push citizen.name
      else
        Citizen.demvotes.push citizen.name
      end
    elsif citizen.politics.downcase == "neutral"
      if (1 + rand(100)) > 50
        Citizen.repvotes.push citizen.name
      else
        Citizen.demvotes.push citizen.name
      end
    elsif citizen.politics.downcase == "liberal"
      if (1 + rand(100)) > 75
        Citizen.repvotes.push citizen.name
      else
        Citizen.demvotes.push citizen.name
      end
    elsif citizen.politics.downcase == "socialist"
      if (1 + rand(100)) > 90
        Citizen.repvotes.push citizen.name
      else
        Citizen.demvotes.push citizen.name
      end
    else
      puts "Invalid political affiliation"
    end 
  end
  # p Citizen.demvotes
  # p Citizen.repvotes
end


def define_winner
  if Citizen.demvotes.length > Citizen.repvotes.length
    puts "The Democratic candidate has won the election!"
  else
    puts "The Republician candidate has won the election!"
  end
end





end

