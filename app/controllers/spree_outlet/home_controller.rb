class SpreeOutlet::HomeController < SpreeOutlet::ApplicationController
  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Order
  helper Spree::Api::ApiHelpers

  def index
    @user = spree_current_user
    @order = current_order
  end
end