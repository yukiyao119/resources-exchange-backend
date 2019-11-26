class UserSkillSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :skill
  belongs_to :user, serializer: UserSkillUserSerializer

  has_many :exchangee_exchanges
  has_many :exchanger_exchanges

end
