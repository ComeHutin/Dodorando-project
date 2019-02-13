class UserMailer < ApplicationMailer
  def welcome_email(mail_user)
    @mail_user = mail_user
    mail(from: "colin.lecordier@email.fr", to: @mail_user,
        subject: "Bienvenue sur ce site de chaton")
   end

   def client_order(mail_user)
   	@mail_user = mail_user
    mail(from: "colin.lecordier@email.fr", to: @mail_user,
        subject: "merci pour votre commande") 
   end
end
