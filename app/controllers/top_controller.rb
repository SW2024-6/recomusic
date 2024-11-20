class TopController < ApplicationController
    def main
        if session[:login_uid]
            render "main"
        else
            render "login"
        end
    end
    
    def login
        user = User.find_by(uid: params[:uid])
        
        if user && BCrypt::Password.new(user.pass) == params[:pass]
            session[:login_uid] = user.uid
            redirect_to top_main_path
        else
             render "error",status: 422
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
    
    def signup
        uid = params[:uid]
        password = params[:pass]
        history = params[:history]
        practice = params[:practice]
        
        ango = BCrypt::Password.create(password)
        
        User.create(uid: uid, pass: ango, history: history, practice: practice)
        redirect_to root_path
    end
    
    def signup_page
        render "signup"
    end
end
