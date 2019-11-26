class ExchangeSerializer < ActiveModel::Serializer
  attributes :id, :time, :location, :description, :exchanger, :exchangee

  def exchanger
    {
      user: object.exchanger.user,
      skill: object.exchanger.skill.name
    }
  end

  def exchangee
    {
      user: object.exchangee.user,
      skill: object.exchangee.skill.name
    }
  end

end
