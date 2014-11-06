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
