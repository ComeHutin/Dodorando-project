class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
  	@user = User.from_facebook(request.env['omniauth.auth'])
  	if @user.persisted?
      sign_in_and_redirect @user, event: :authentification
    else
      session['devise.facebook'] = request.env['omniauth.auth']
      flash[:alert] = "Impossible de se connecter via facebook, connectez-vous via votre adresse email"
      redirect_to new_user_session_path
  	end
  end
end