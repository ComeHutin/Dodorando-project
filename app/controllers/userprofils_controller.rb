class UserprofilsController < ApplicationController
  def show
  	@user = current_user
	@hosted_room = Hosted.where(user_id: @user.id)
  end

  private

  
end


