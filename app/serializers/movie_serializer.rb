class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :mpaa_rating, :released_date, :director, :writer, :plot, :language, :country, :poster_url, :producer

  def initialize(movie_object, total = Movie.all.count)
    @movie = movie_object
    @total = total
  end

  def to_serialized_json
    # puts "ALLL MOVIES #{@movie.count}"
    if @movie.class == Array
      puts @movie.class
      puts [].class

      obj =
      {
        except: %i[ created_at year released_date director writer plot language country producer updated_at],
        include:
        {
          ratings:{only: %i[ id amount ]},
        }
      }

    else
      obj =
      {
         include:
         {
           comments:{
             include:{
             user: {only: %i[ username id ]}
             },only: %i[ id title content]},
           ratings:{
             include:{
             user: {only: %i[ username id ]}
             },only: %i[ id amount ]},
           actors: {except: %i[ created_at updated_at]},
           genres: {except: %i[ created_at updated_at]}

          },
        except: %i[ created_at updated_at]
      }
    end


    {movies: @movie, total: @total}.to_json(obj)
  end

end
