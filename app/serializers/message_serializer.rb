class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :exchange_id, :content

end
