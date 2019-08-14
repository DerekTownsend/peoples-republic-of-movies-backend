class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  has_one :user
  has_one :movie

  def initialize(comment_object)
    @comment = comment_object
  end

    def to_serialized_json
      obj =
      {
        include:
        {
          likes:{only: %i[ id ]},
          movie:{except: %i[ created_at updated_at ]},
          user:{only: %i[ id username ]},
        }
      }

      @comment.to_json(obj)
    end

end
