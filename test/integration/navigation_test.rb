require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "Root mounting url sends you to home#index" do
    # assert_routing "/spree_outlet", :controller => "home", :action => "index"
  end
end

