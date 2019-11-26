class UserSkillUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :displayname, :donated_hour, :time_slot, :location, :img, :bio
end
