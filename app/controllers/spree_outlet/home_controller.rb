class SpreeOutlet::HomeController < SpreeOutlet::ApplicationController

  def index
    @current_user = spree_current_user
  end
end