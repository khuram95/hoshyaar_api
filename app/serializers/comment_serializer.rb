class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :text

  def user_name
    object.user.user_name
  end
end