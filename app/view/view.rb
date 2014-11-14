
module View
  def self.new_line
    puts "\n\n"
  end
  def self.welcome
    clear_screen!
    move_to_home!
puts <<-STRING
==================================================================
    Welcome to the Adequate Restaurant Suggestion App
==================================================================

STRING
  puts "What is your name?"
  end
  def self.display_business(business)
    # business_array = Business.all
    # pick = business_array.sample
    puts <<-STRING

==================================================================
Here's a Suggestion:
Name:    #{business.name}
Location:    #{business.location}
Rating:    #{business.rating}
Review:    #{business.review}
==================================================================
    STRING
  end

  def self.food_choices
    puts "What kind of food do you want?"
    puts <<-STRING
    ----sandwiches----
    ----italian-------
    italian sandwiches
    ----pizza----------
    ----mechanics------

Choose one. Or not.

    STRING
  end

  def self.render(message)
    puts message
  end

  def self.print_searches(username)
    puts "\n=================================================================="
    puts "Your previous search results:"
    user = User.where("name = '#{username}'").first.businesses
    user.each { |business| puts "#{business.id}. #{business.name}" }
    puts "=================================================================="
  end
  def self.clear_screen!
    print "\e[2J"
  end

# Moves cursor to the top left of the terminal
  def self.move_to_home!
    print "\e[H"
  end
end




#  ARGV

# p "Welcome to the world's most terrible food app."
# p "Enter your zip code: "
# zip = gets.chomp
# p "What do you want to eat?"
# category = gets.chomp


=begin
name
rating
display_address
review snippet
categories
=end

# display object

# p "---" * 30
# p "#{business.review.snippet}"  # extract first sentence.  business.review.split on . & slice [0]?
# p "---" * 30
# p "Head to #{business.name} to get your #{business.categories} on #{business.display_address}"

