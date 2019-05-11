class PagesController < ApplicationController
    def index
        if user_signed_in?
            if current_user.role == "teacher"
                redirect_to lessons_path
            else
                redirect_to explore_path
            end
        end
    end

    def show
        @user = UsersLanguage.find_by(user_id: current_user.id)
    end
end