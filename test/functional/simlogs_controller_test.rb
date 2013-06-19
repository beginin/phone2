require 'test_helper'

class SimlogsControllerTest < ActionController::TestCase
  setup do
    @simlog = simlogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simlogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simlog" do
    assert_difference('Simlog.count') do
      post :create, simlog: { datestart: @simlog.datestart, datestop: @simlog.datestop, sim_id: @simlog.sim_id, type: @simlog.type, user_id: @simlog.user_id }
    end

    assert_redirected_to simlog_path(assigns(:simlog))
  end

  test "should show simlog" do
    get :show, id: @simlog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @simlog
    assert_response :success
  end

  test "should update simlog" do
    put :update, id: @simlog, simlog: { datestart: @simlog.datestart, datestop: @simlog.datestop, sim_id: @simlog.sim_id, type: @simlog.type, user_id: @simlog.user_id }
    assert_redirected_to simlog_path(assigns(:simlog))
  end

  test "should destroy simlog" do
    assert_difference('Simlog.count', -1) do
      delete :destroy, id: @simlog
    end

    assert_redirected_to simlogs_path
  end
end
