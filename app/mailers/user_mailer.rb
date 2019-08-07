class UserMailer < ApplicationMailer
    default from: 'ruby.mailer.testing@gmail.com'
    
    def confirmation_email
        @user = params[:user]
        @url = 'localhost:3000/login'
        mail(to: @user.email, subject: 'Stockwatchlist.com Confirmation Email')
    end
end
