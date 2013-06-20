require 'test_helper'

class LoadcallsControllerTest < ActionController::TestCase
  setup do
    @loadcall = loadcalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loadcalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loadcall" do
    assert_difference('Loadcall.count') do
      post :create, loadcall: { admin: @loadcall.admin, date: @loadcall.date }
    end

    assert_redirected_to loadcall_path(assigns(:loadcall))
  end

  test "should show loadcall" do
    get :show, id: @loadcall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loadcall
    assert_response :success
  end

  test "should update loadcall" do
    put :update, id: @loadcall, loadcall: { admin: @loadcall.admin, date: @loadcall.date }
    assert_redirected_to loadcall_path(assigns(:loadcall))
  end

  test "should destroy loadcall" do
    assert_difference('Loadcall.count', -1) do
      delete :destroy, id: @loadcall
    end

    assert_redirected_to loadcalls_path
  end
end
