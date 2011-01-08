class SessionsController < ApplicationController

  def new
  
  end

  def create
    render :text => request.env['rack.auth'].inspect
  end
end
