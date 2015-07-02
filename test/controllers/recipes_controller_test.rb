require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  def setup
    @user = users(:one)
    @recipe = recipes(:one)
  end

  test "should redirect when not logged in" do
    get :new
    assert_redirected_to new_user_session_path
    get :show, id: @recipe
    assert_redirected_to new_user_session_path
  end

  test "should show recipes when not logged in" do
    get :index
    assert :success
  end

  test "should get new when logged in" do
    sign_in(@user)
    get :new
    assert :success
  end
end
