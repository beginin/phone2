require 'test_helper'

class TnumbersControllerTest < ActionController::TestCase
  setup do
    @tnumber = tnumbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tnumbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tnumber" do
    assert_difference('Tnumber.count') do
      post :create, tnumber: { block: @tnumber.block, datein: @tnumber.datein, dateout: @tnumber.dateout, sortnumber: @tnumber.sortnumber, tarif_id: @tnumber.tarif_id, voicenumber: @tnumber.voicenumber }
    end

    assert_redirected_to tnumber_path(assigns(:tnumber))
  end

  test "should show tnumber" do
    get :show, id: @tnumber
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tnumber
    assert_response :success
  end

  test "should update tnumber" do
    put :update, id: @tnumber, tnumber: { block: @tnumber.block, datein: @tnumber.datein, dateout: @tnumber.dateout, sortnumber: @tnumber.sortnumber, tarif_id: @tnumber.tarif_id, voicenumber: @tnumber.voicenumber }
    assert_redirected_to tnumber_path(assigns(:tnumber))
  end

  test "should destroy tnumber" do
    assert_difference('Tnumber.count', -1) do
      delete :destroy, id: @tnumber
    end

    assert_redirected_to tnumbers_path
  end
end
