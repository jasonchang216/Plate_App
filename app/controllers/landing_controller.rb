class LandingController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in

  def index
    @ratings = Rating.sorted
  end
end
