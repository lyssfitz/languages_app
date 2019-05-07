class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_lesson, only: [:show, :edit, :update, :destroy]
    before_action :authorise_user, only: [:edit, :update, :destroy]
    before_action :authorise_teacher, only: [:new, :edit, :update]
    before_action :authorise_student, only: [:explore]
    before_action :set_languages, only: [:new, :edit]
    before_action :set_difficulty, only: [:new, :edit]


    def index
        @lessons = current_user.lessons
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
        @comment = Comment.new
    
    end

    def edit 
        
    end

    def update 
        
    end

    def destroy 

    end

    def explore
        @language_ids = current_user.users_languages.pluck(:language_id)
        @lessons = Lesson.where(language_id: @language_ids)
        
    end

    private

    def set_languages
        @languages = current_user.languages
    end

    def set_difficulty
        @difficulty = Lesson.difficulties.keys
    end

    def set_lesson
        @lesson = Lesson.find(params[:id])
    end

    def authorise_user
        unless @lesson.user_id == current_user.id
            redirect_to lessons_path
        end
    end

    def authorise_teacher
        if current_user.role != "teacher"
            redirect_to lessons_path
        end
    end

    def authorise_student
        if current_user.role != "student"
            redirect_to lessons_path
        end
    end

    def lesson_params
        params.require(:lesson).permit(:language_id, :body, :lesson_date, :lesson_time, :street, :city, :state, :postcode, :price, :max_students, :difficulty)
    end 
end