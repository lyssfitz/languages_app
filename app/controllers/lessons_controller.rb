class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_lesson, only: [:show, :edit, :update, :destroy]
    before_action :set_languages, only: [:new, :edit]
    before_action :set_difficulty, only: [:new, :edit]


    def index
        @lessons = Lesson.all
    end

    def create
        @lesson = current_user.lessons.create(lesson_params)

        if @lesson.errors.any?
            set_languages
            set_difficulty
            render "new"
        else
            redirect_to lessons_path    
        end
        
    end

    def new
        @lesson = Lesson.new
    end

    def show
        
    end

    def edit 
        
    end

    def update 
        
    end

    def destroy 
        
    end

    private

    def set_languages
        @languages = Language.all
    end

    def set_difficulty
        @difficulty = Lesson.difficulties.keys
    end

    def set_lesson
        @lesson = Lesson.find(params[:id])
    end

    def lesson_params
        params.require(:lesson).permit(:language_id, :body, :lesson_date, :lesson_time, :street, :city, :state, :postcode, :price, :max_students, :difficulty )
    end 
end