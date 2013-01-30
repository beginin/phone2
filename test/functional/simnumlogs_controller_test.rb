require 'test_helper'

class SimnumlogsControllerTest < ActionController::TestCase
  setup do
    @simnumlog = simnumlogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simnumlogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simnumlog" do
    assert_difference('Simnumlog.count') do
      post :create, simnumlog: { datestart: @simnumlog.datestart, datestop: @simnumlog.datestop, sim_id: @simnumlog.sim_id, tnumber_id: @simnumlog.tnumber_id }
    end

    assert_redirected_to simnumlog_path(assigns(:simnumlog))
  end

  test "should show simnumlog" do
    get :show, id: @simnumlog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @simnumlog
    assert_response :success
  end

  test "should update simnumlog" do
    put :update, id: @simnumlog, simnumlog: { datestart: @simnumlog.datestart, datestop: @simnumlog.datestop, sim_id: @simnumlog.sim_id, tnumber_id: @simnumlog.tnumber_id }
    assert_redirected_to simnumlog_path(assigns(:simnumlog))
  end

  test "should destroy simnumlog" do
    assert_difference('Simnumlog.count', -1) do
      delete :destroy, id: @simnumlog
    end

    assert_redirected_to simnumlogs_path
  end
end
