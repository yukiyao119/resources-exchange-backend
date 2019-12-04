class User < ApplicationRecord
    has_many :user_skills
    has_many :skills, through: :user_skills
    has_many :reviews
    has_many :messages
    has_secure_password

    validates :username, uniqueness: true

    # def user_skill_names
    #     self.skills.map{|skill| skill.name }
    #     # a.map! {|x| x + "!" }
    # end
    
end
