# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'
require_relative 'app/models/lists'
require 'sqlite3'
require 'byebug'


# Your Code begins from this line onwards #

# List.create(name: "Brad Pitt", phone: "0123779886", address: "Sunnyvilla 1762, Off Hello Road")
# List.create(name: "Ali Baba", phone: "01988888888", address: "China Jungle Villa, 2278139")


def add(name, phone, address)

      List.create(name: name, phone: phone, address: address)

      puts "Congrats! Name: #{name}, Phone: #{phone}, Address: #{address} has been added!"

end

# add("Ray Ban", "0123770665", "USS Enterprise, Galaxy")

def list
	puts "\e[2J" 
    print "\e[H"

    n = 0
    g = 20

    while g >= 0
	puts ("W  W  W" + " "*(g*2) + "W  W  W").center(180) 
	if g == 0
		puts "Johnson Khoo               W W <<00>> W W               Productions".center(180)
	end
	g -= 2
	sleep(0.2)
    end

    while n <= 23
	puts ("w  W  W" + " "*(n*2) + "W  W  W").center(180)
	n += 2
	sleep(0.2)
    end

    sleep(1)

    puts "\e[2J" 
    print "\e[H"

    puts ""
    puts "============================================================================================================".ljust(180)
    puts "                        THE BEST YELLOW PAGES IN THE UNIVERSE! [v.2.4] ZBAR ".ljust(180)
    puts "============================================================================================================".ljust(180)
    puts ""

	everyone = List.all

	    puts "No.".ljust(4) + "Name".ljust(20) +      "Phone".ljust(16)   +     "Address".ljust(30)
	    puts "===".ljust(4) + "====".ljust(20) +      "=====".ljust(16)   +     "==========".ljust(30) 
	    puts ""

	everyone.each do |row|
		puts "#{row.id}.".ljust(4) + "#{row.name}".ljust(20) +  "#{row.phone}".ljust(16) +  "#{row.address}".ljust(30)
	end
	puts ""
end


def update(id, name, phone, address)

  list_of_ids = []

  List.all.each do |idv|
	  list_of_ids << idv.id
  end

  if (list_of_ids.include?id) == false
  	puts "\e[2J" 
    print "\e[H"
  	puts "Sorry man, there is no such id/person! Did you remember correctly? Please try again..".center(180)
    puts ""
  else
  	list_of_people = List.where(id: id)
  	target = list_of_people[0]
  	target.name = name
  	target.phone = phone
  	target.address = address

  	target.save
  	puts "\e[2J" 
    print "\e[H"
  	puts "Yayy! The new data has been updated!".center(180)
  	puts ""
  end

end

# update(3, "Hello Mama", "0123660778", "221 Jalan Mati" )

# update(5, "Hello Boy", "0123660778", "221 Jalan Mati" )

# list


def delete(id)

    list_of_ids = []

    List.all.each do |idv|
	  list_of_ids << idv.id
    end

    if (list_of_ids.include?id) == false
    puts "\e[2J" 
    print "\e[H"
  	puts "Sorry man, there is no such id/person! Did you remember correctly? Please try again..".center(180)
    puts ""
    else
  	list_of_people = List.where(id: id)
  	target = list_of_people[0]
  	target.destroy


    puts "\e[2J" 
    print "\e[H"
  	puts "Muahahhahaahha!! AHHAHA! We've found that person and BLOWN that person up!".center(180)
  	puts ""
    end 
end


if ARGV[0] == "list"
	list
elsif ARGV[0] == "add"
	add(ARGV[1],ARGV[2],ARGV[3])
elsif ARGV[0] == "delete"
	delete(ARGV[1].to_i)
elsif ARGV[0] == "update"
	update(ARGV[1].to_i, ARGV[2], ARGV[3],ARGV[4])
end


# app = Model.new
# app.to_s