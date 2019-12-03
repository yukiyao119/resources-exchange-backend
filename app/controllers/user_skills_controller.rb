class UserSkillsController < ApplicationController

    def index
        user_skills = UserSkill.all
        render json: user_skills, include: "**", status: 200
    end

    def show 
        user_skill = UserSkill.find(params[:id])
        render json: { user_skill: UserSkillSerializer.new(user_skill) }, status: 200
    end

    def create
        user_skill = UserSkill.create(user_skill_params)
        if user_skill.valid? 
            render json: { user_skill: UserSkillSerializer.new(user_skill) }, status: 200
        else
            render json: { errors: user_skill.errors.full_messages } , status: :unprocessable_entity
        end 
    end

    def destroy 
        user_skill = UserSkill.find(params[:id])
        user_skill.destroy
        render json: user_skill
    end


    private

    def user_skill_params
        params.permit(:user_id, :skill_id)
    end

end
