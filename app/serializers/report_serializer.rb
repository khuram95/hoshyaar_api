class ReportSerializer < ActiveModel::Serializer

  class CommentSerializer < ActiveModel::Serializer
    attributes :id, :user_name, :text, :created_at
    def user_name
      object.user&.user_name
    end
  end

  class ReportReaction < ActiveModel::Serializer
    attributes :id, :user_name, :is_agree, :created_at, :user_id
    def user_name
      object.user&.user_name
    end
  end

  attributes :id, :authencity, :user_id, :report_date, :report_text, :removed_date, :is_removed,
              :longitude, :latitude, :removed_by, :school_id, :video, :voice_message, :created_at,
              :updated_at, :photos, :school, :user, :report_address, :comments,
              :report_reactions, :agree, :dis_agree

  has_many :comments, serializer: CommentSerializer
  has_many :report_reactions, serializer: ReportReaction

  def photos
    object.photos
  end

  def school
    object.school
  end

  def user
    object.user
  end

  def agree
    object.report_reactions.where(is_agree: true).count
  end

  def dis_agree
    object.report_reactions.where(is_agree: false).count
  end

  def report_address
    object.longitude ?
        (lat_long = object.latitude.to_s + ',' + object.longitude.to_s
        parse_address = Geocoder.search(lat_long).first.address.split(',')
        parse_address[0] + ', '+ parse_address[2])
      : 'not found report address'
  end

  # def comments
  #   object.comments
  # end

  # def comment_user_name
  #   object.comments.each do |comment|
  #     return comment.user&.user_name
  #   end
  # end

  # def report_reaction
  #   object.report_reactions
  # end

  # def reaction_user_name
  #   object.report_reactions.each do |reaction|
  #     return reaction.user&.user_name
  #   end
  # end
end
