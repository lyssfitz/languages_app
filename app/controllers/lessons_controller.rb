class LessonsController < ApplicationController
    before_action :set_lesson, only: [:show, :edit, :update, :destroy]

    def index
        @lessons = Lesson.all
    end

    def create
        @lesson = Lesson.create(lesson_params)
    end

    def new
        @lesson = Lesson.new
        @languages = Language.all
        @difficulty = Lesson.difficulties.keys
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

    def set_lesson
        id = params[:id]
        @lesson = Lesson.find(id)
    end

    def lesson_params
        params.require(:lesson).permit(:language, :body, :lesson_date, :lesson_time, :street, :city, :state, :postcode, :price, :max_students, :difficulty )
    end 
end