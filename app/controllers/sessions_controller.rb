class SessionsController < ApplicationController
  def new
  end

  def verify
        user = User.find_by_email(session[:email])
        if user.verification_code == params[:verification_code]
            params.merge(email_confirmed: true)
            user.update_attribute(:email_confirmed, true)
            t = Time.now
            user.update_attribute(:verified_at, (t + (7*60*60)).to_s)
            redirect_to watchlists_url, notice: "User successfully verified!"
            session[:user_id] = user.id
            session[:name] = user.name
            session[:email] = nil
        else
            flash.now[:alert] = "Invalid verification code. Please try sending confirmation email again for code."
            render "verify"
        end
        
  end

  def resend
        if session[:email] != nil
            @temp= User.find_by_email(session[:email])
            UserMailer.with(user: @temp).confirmation_email.deliver_later
            puts "Email resent"
        end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) && user.email_confirmed == true
        session[:user_id] = user.id
        session[:name] = user.name
        redirect_to watchlists_url, notice: "Logged in!"
    elsif user && user.authenticate(params[:password]) && user.email_confirmed == false
        session[:email] = user.email
        render "verify"
    else
        flash.now[:alert] = "Email or password is invalid"
        render "new"
    end
  end

  def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: "Logged out!"
  end
end
