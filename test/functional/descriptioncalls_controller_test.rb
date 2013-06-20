require 'test_helper'

class DescriptioncallsControllerTest < ActionController::TestCase
  setup do
    @descriptioncall = descriptioncalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:descriptioncalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create descriptioncall" do
    assert_difference('Descriptioncall.count') do
      post :create, descriptioncall: { fin: @descriptioncall.fin, name: @descriptioncall.name }
    end

    assert_redirected_to descriptioncall_path(assigns(:descriptioncall))
  end

  test "should show descriptioncall" do
    get :show, id: @descriptioncall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @descriptioncall
    assert_response :success
  end

  test "should update descriptioncall" do
    put :update, id: @descriptioncall, descriptioncall: { fin: @descriptioncall.fin, name: @descriptioncall.name }
    assert_redirected_to descriptioncall_path(assigns(:descriptioncall))
  end

  test "should destroy descriptioncall" do
    assert_difference('Descriptioncall.count', -1) do
      delete :destroy, id: @descriptioncall
    end

    assert_redirected_to descriptioncalls_path
  end
end
