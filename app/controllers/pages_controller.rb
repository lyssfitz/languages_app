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
end