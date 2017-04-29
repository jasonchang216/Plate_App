class HomeController < ApplicationController

  layout 'application'

  def index
    session[:user_id] = nil
    session[:username] = nil
  end
end
