class SessionsController < ApplicationController

  def new
    if Rails.env.test? || Rails.env.development?
      @users = User.all
    end
  end

  def create
    auth = request.env['rack.auth']
    unless @auth = Authorization.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    # Log the authorizing user in.
    self.current_user = @auth.user

    redirect_to shopping_lists_path
  end

  if Rails.env.test? || Rails.env.development?
    def sign_in_as
      self.current_user = User.find(params[:id])
      redirect_to shopping_lists_path
    end
  end

  def destroy
    self.current_user = nil
    flash[:notice] = "Logout successful!"
    redirect_to root_path
  end
end
