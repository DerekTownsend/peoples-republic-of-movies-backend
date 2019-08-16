class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  has_one :user
  has_one :movie

  def initialize(comment_object, comments_max=nil)
    @comment = comment_object
    @comments_max = comments_max
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
      if @comments_max
        {comments: @comment, total: @comments_max}.to_json(obj)
      else
        @comment.to_json(obj)
      end
    end

end
