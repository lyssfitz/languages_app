class PagesController < ApplicationController
    def index
    end

    def show
        @user = current_user

        # if current_user.has_role? :teacher
        #     manager_dashboard
        # else
        #     operator_dashboard
        # end
    end

    def home
        render plain: "homepage Create lesson, explore lessons, my lessons, edit profile"
    end
end