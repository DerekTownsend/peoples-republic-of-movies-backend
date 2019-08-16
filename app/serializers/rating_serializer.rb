class RatingSerializer < ActiveModel::Serializer
  attributes :id, :amount
  has_one :user
  has_one :movie

  def initialize(rating_object, ratings_max=nil)
    @rating = rating_object
    @ratings_max = ratings_max
  end

    def to_serialized_json

      obj =
      {
        include:
        {
          movie:{only: %i[ id title ]}
        }
      }
      if @ratings_max
        {ratings: @rating, total: @ratings_max}.to_json(obj)
      else
        @rating.to_json(obj)
      end
    end
end
