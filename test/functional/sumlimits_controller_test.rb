require 'test_helper'

class SumlimitsControllerTest < ActionController::TestCase
  setup do
    @sumlimit = sumlimits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sumlimits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sumlimit" do
    assert_difference('Sumlimit.count') do
      post :create, sumlimit: { money: @sumlimit.money, namelimit: @sumlimit.namelimit }
    end

    assert_redirected_to sumlimit_path(assigns(:sumlimit))
  end

  test "should show sumlimit" do
    get :show, id: @sumlimit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sumlimit
    assert_response :success
  end

  test "should update sumlimit" do
    put :update, id: @sumlimit, sumlimit: { money: @sumlimit.money, namelimit: @sumlimit.namelimit }
    assert_redirected_to sumlimit_path(assigns(:sumlimit))
  end

  test "should destroy sumlimit" do
    assert_difference('Sumlimit.count', -1) do
      delete :destroy, id: @sumlimit
    end

    assert_redirected_to sumlimits_path
  end
end
