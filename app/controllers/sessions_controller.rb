class SessionsController < ApplicationController
  
  def create
    user = User.find_by(username: params[:username])
    session[:user_id] = user
    if session[:user]
    render json: user
    else 
      render json: {error: "You have to login first."}, status: :unauthorized
  end
end

  def destroy
    session.delete :user_id
    head :no_content
  end

end
