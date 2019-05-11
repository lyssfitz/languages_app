class PagesController < ApplicationController
    def index
    end

    def show
        @user = UsersLanguage.find_by(user_id: current_user.id)
    end
end