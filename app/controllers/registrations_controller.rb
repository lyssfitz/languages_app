class RegistrationsController < Devise::RegistrationsController
    def new
        super
    end
  
    def create
        @languages = Language.all
        UsersLanguage.create(
            
        )
    end
  
    def update
        super
    end
  end 