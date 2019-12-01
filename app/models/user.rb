class User < ApplicationRecord
    has_many :user_skills
    has_many :skills, through: :user_skills
    has_secure_password

    def user_skill_names
        self.skills.map{|skill| skill.name }
        # a.map! {|x| x + "!" }
    end
    
end
