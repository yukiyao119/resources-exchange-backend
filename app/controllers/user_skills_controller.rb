class UserSkillsController < ApplicationController

    def index
        user_skills = UserSkill.all
        render json: user_skills, include: "**", status: 200
    end

    def show 
        user_skill = UserSkill.find(params[:id])
        # if user_id_from_token == user_id.to_i
        #     user = User.find(user_id) 
        #     render json: user
        # else 
        #     render json: { wrong_token: true}, status: :unauthorized
        # end
        render json: user_skill, include: "**", status: 200
    end

    def create
        user_skill = UserSkill.create(skill_id: params[skill_id], user_id: params[user_id])
        # if user.valid?
        #     render json: {ok: true}
        # else
        #     render json: { errors: user.errors.full_messages } , status: :unprocessable_entity
        # end 
        render json: user_skill, include: "**", status: 200
    end


end
