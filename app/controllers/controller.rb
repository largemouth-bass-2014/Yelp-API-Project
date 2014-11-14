class Controller
  # include View

  def run
    View.welcome
    username = gets.chomp
    user = User.create(name: username)

    choice = ""
    until choice == "exit"
      View.render("\nEnter [1] to view your previous searches, [2] to make a new search, or [exit].")

      choice = gets.chomp
      case choice
      when "1"
        get_search_list(username)
      when "2"
        generate_yelp_search(username)
      end
    end
  end

  def get_search_list(username)
    return puts "You have no saved searches." if User.where("name = '#{username}'").first.businesses.empty?
    View.print_searches(username)
    View.render("Enter search number to view more info.")
    more_info = gets.chomp
    View.display_business(Business.find(more_info))
  end

  def generate_yelp_search(username)
    View.render("Where are you? (City/Address/Zipcode/Neighborhood")
    location = gets.chomp
    View.food_choices
    category = gets.chomp
    random_business = YelpSearch.get_random_business(location, category)
    User.where("name = '#{username}'").first.businesses << random_business
    View.display_business(random_business)
  end

end

