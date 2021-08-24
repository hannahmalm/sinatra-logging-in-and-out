require 'sinatra/base'

class Helpers
    #these are some helper methods to use in the other controllers and the forms
    #copy and paste these in future labs to find the current user and to see if the user is logged in
    def self.current_user(session)
        @user = User.find_by_id(session[:user_id])
    end 


    #this will return true or false
    def self.is_logged_in?(session)
        !!session[:user_id]
    end 
end