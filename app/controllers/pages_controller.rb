class PagesController < ApplicationController
    def index
    end

    def show
        @user = current_user
        @language = current_user.languages
    end
end