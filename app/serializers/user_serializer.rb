class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :firstname, :lastname, :email, :password_digest, :admin

  def initialize(user_object, jwt = nil)
    @user = user_object
    @jwt = jwt
  end

    def to_serialized_json
      obj =
      {
        include:
        {
          favorites:{},
          movie_favorites:{except: %i[ created_at year released_date director writer plot language country producer updated_at]},
          },except: %i[updated_at]
      }
      if @jwt
        {user: @user.to_json(obj), jwt: @jwt}
      else
        @user.to_json(obj)
      end
    end
end
