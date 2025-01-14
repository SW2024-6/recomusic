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
        if uid == 'root'
          role = 'host'
        else
          role = 'user'
        end
        password = params[:pass]
        history = params[:history]
        practice = params[:practice]
        
        ango = BCrypt::Password.create(password)
        
        @user = User.create(uid: uid, pass: ango, history: history, practice: practice, role: role)
        if @user.save
            redirect_to root_path
        else
            render 'signup', status: :unprocessable_entity
        end
    end
    
    def signup_page
        @user = User.new
        render "signup"
    end
end
