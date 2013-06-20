require 'test_helper'

class TypecallsControllerTest < ActionController::TestCase
  setup do
    @typecall = typecalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:typecalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create typecall" do
    assert_difference('Typecall.count') do
      post :create, typecall: { name: @typecall.name }
    end

    assert_redirected_to typecall_path(assigns(:typecall))
  end

  test "should show typecall" do
    get :show, id: @typecall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @typecall
    assert_response :success
  end

  test "should update typecall" do
    put :update, id: @typecall, typecall: { name: @typecall.name }
    assert_redirected_to typecall_path(assigns(:typecall))
  end

  test "should destroy typecall" do
    assert_difference('Typecall.count', -1) do
      delete :destroy, id: @typecall
    end

    assert_redirected_to typecalls_path
  end
end
