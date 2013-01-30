require 'test_helper'

class CfusControllerTest < ActionController::TestCase
  setup do
    @cfu = cfus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cfus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cfu" do
    assert_difference('Cfu.count') do
      post :create, cfu: { namecfu: @cfu.namecfu }
    end

    assert_redirected_to cfu_path(assigns(:cfu))
  end

  test "should show cfu" do
    get :show, id: @cfu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cfu
    assert_response :success
  end

  test "should update cfu" do
    put :update, id: @cfu, cfu: { namecfu: @cfu.namecfu }
    assert_redirected_to cfu_path(assigns(:cfu))
  end

  test "should destroy cfu" do
    assert_difference('Cfu.count', -1) do
      delete :destroy, id: @cfu
    end

    assert_redirected_to cfus_path
  end
end
