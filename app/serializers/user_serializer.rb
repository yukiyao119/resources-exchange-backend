class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :displayname, :donated_hour, :time_slot, :location, :img, :bio, :lat, :lng
  # , :user_skill_names
  
  has_many :user_skills
  has_many :reviews
  has_many :messages

end
