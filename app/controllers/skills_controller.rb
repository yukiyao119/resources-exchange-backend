class SkillsController < ApplicationController

    def index
        @skills = Skill.all
        render json: @skills, include: "**", status: 200
        # else  
        #     render json: { go_away: true }, status: :unauthorized
        # end

    end

    def show 
        skill = Skill.find(params[:id])
        render json: skill, include: "**", status: 200
    end

end
