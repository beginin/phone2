require 'test_helper'

class TypeconnectsControllerTest < ActionController::TestCase
  setup do
    @typeconnect = typeconnects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:typeconnects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create typeconnect" do
    assert_difference('Typeconnect.count') do
      post :create, typeconnect: { name: @typeconnect.name }
    end

    assert_redirected_to typeconnect_path(assigns(:typeconnect))
  end

  test "should show typeconnect" do
    get :show, id: @typeconnect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @typeconnect
    assert_response :success
  end

  test "should update typeconnect" do
    put :update, id: @typeconnect, typeconnect: { name: @typeconnect.name }
    assert_redirected_to typeconnect_path(assigns(:typeconnect))
  end

  test "should destroy typeconnect" do
    assert_difference('Typeconnect.count', -1) do
      delete :destroy, id: @typeconnect
    end

    assert_redirected_to typeconnects_path
  end
end
