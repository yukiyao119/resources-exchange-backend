class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :exchange_id, :content, :author
  # , :reviewer

  # def reviewer 
  #   {
  #     displayname: object.user.displayname
  #   }
  # end

end
