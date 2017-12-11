class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

    def welcome(user)
        @user = user  # Instance variable => available in view

        mail(to: @user.email, subject: 'Bienvenue sur back-Pack')
    end


    def invite(invitation)
      @invitation = invitation
      @trip = @invitation.trip

          mail(
            to:       @invitation.email,
            subject:  "Venez rejoindre vos amis sur le voyage #{@trip.title} !"
          )
    end
end
