gem 'rest-client'
# 351
User.destroy_all

# Mine
# @apikey = "1d1382f6"
# Alex's
# @apikey = "f71d8206"


def initial_parse
  page=190
  while page <= 200 do
    # p page
    movie_data = RestClient.get("http://www.omdbapi.com/?s=movie&page=#{page}&apikey=#{@apikey}")
    parsed_movie_data = JSON.parse(movie_data)['Search']
    more_detailed_search(parsed_movie_data)
    page+=1
  end
end

def more_detailed_search(parsed_movie_data)
  parsed_movie_data.each do |movie|
    id = movie['imdbID']
    data = RestClient.get("http://www.omdbapi.com/?i=#{id}&apikey=#{@apikey}")
    parsed_data = JSON.parse(data)

    # puts parsed_data
    title = parsed_data['Title']
    year = parsed_data['Year']
    mpaa_rating = parsed_data['Rated']
    released_date = parsed_data['Released']
    director = parsed_data['Director']
    writer = parsed_data['Writer']
    plot = parsed_data['Plot']
    language = parsed_data['Language']
    country = parsed_data['Country']
    poster_url = parsed_data['Poster']
    producer = parsed_data['Production']

    genre_list = create_genres(parsed_data['Genre'].split(", "))
    actor_list=create_actors(parsed_data['Actors'].split(", "))

    created_movie = Movie.find_or_create_by(title: title, year: year, mpaa_rating: mpaa_rating, released_date: released_date, director: director, writer: writer, plot: plot, language: language, country: country, poster_url: poster_url, producer: producer)

    created_movie.actors << actor_list
    created_movie.genres << genre_list
  end
end

def create_actors(actors)
  actors.collect do |actor_name|
    Actor.find_or_create_by(name: actor_name)
  end
end

def create_genres(genres)
  genres.collect do |genre_name|
    Genre.find_or_create_by(name: genre_name)
  end
end

# if Movie.all.count == 0
#   initial_parse
# end

# initial_parse

User.create(username:"admin", firstname:"admin", lastname:"admin", email:"admin@gmail.com", password:"password", admin:true)
