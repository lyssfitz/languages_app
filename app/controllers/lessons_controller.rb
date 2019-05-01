class LessonsController < ApplicationController
    before_action :set_lesson, only: [:show, :edit, :update, :destroy]

    def index
        @lessons = Lesson.all
    end

    def create

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
end