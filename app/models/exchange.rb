
class Exchange < ApplicationRecord

    has_many :reviews

    belongs_to :exchanger, foreign_key: "exchanger_id", class_name: "UserSkill"
    belongs_to :exchangee, foreign_key: "exchangee_id", class_name: "UserSkill"

end

