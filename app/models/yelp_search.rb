module YelpSearch
  require 'yelp'

  CLIENT = Yelp::Client.new({ consumer_key: 'vapOYULI1GchXn7dKoNPQQ',
    consumer_secret: '1niWuYgf6mFALxjgZ6Nt9oe5RNs',
    token: 'DjdQ7WZrf-iMNv6ErUcNCijCJ4yft-80',
    token_secret: 'Pift1EpxQTipd-DBLsnUh73VnQQ'
    })

  def self.get_random_business(location, category)
    params = { term: category,
     limit: 20
   }

   result = CLIENT.search(location, params).businesses.sample
   Business.create(name: result.name,
    location: result.location.display_address.join(' '),
    rating: result.rating,
    category: result.categories.first[0],
    review: result.snippet_text.split("\n\n").first
    )


 end
end