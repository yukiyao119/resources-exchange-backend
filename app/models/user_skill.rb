class UserSkill < ApplicationRecord
    belongs_to :skill
    belongs_to :user


    # the active exchanging part; 
    has_many :exchanger_exchanges, foreign_key: :exchangee_id, class_name: "Exchange"
    has_many :exchangers, through: :exchanger_exchanges, source: :exchanger
    

    # the passive exchanging part;
    has_many :exchangee_exchanges, foreign_key: :exchanger_id, class_name: "Exchange"
    has_many :exchangees, through: :exchangee_exchanges, source: :exchangee
    

    # has_many :user_skill_exchanges
    # has_many :exchanges, through: :user_skill_exchanges

    # def skill_belonged_to
    #     # skill = Skill.find(skill_id).name
    #     "#{self.skill.name}"
    # end

    # def user_belonged_to
    #     # user = User.find(user_id).username
    #     "#{self.user.displayname}"
    # end


end
