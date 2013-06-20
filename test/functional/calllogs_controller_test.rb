require 'test_helper'

class CalllogsControllerTest < ActionController::TestCase
  setup do
    @calllog = calllogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calllogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calllog" do
    assert_difference('Calllog.count') do
      post :create, calllog: { : @calllog., coast: @calllog.coast, date: @calllog.date, descriptioncall_id: @calllog.descriptioncall_id, duration: @calllog.duration, load_id: @calllog.load_id, tnumber: @calllog.tnumber, tnumber_in: @calllog.tnumber_in, tnumber_out: @calllog.tnumber_out, typecall_id: @calllog.typecall_id, typeconnect_id: @calllog.typeconnect_id, valuemb: @calllog.valuemb }
    end

    assert_redirected_to calllog_path(assigns(:calllog))
  end

  test "should show calllog" do
    get :show, id: @calllog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calllog
    assert_response :success
  end

  test "should update calllog" do
    put :update, id: @calllog, calllog: { : @calllog., coast: @calllog.coast, date: @calllog.date, descriptioncall_id: @calllog.descriptioncall_id, duration: @calllog.duration, load_id: @calllog.load_id, tnumber: @calllog.tnumber, tnumber_in: @calllog.tnumber_in, tnumber_out: @calllog.tnumber_out, typecall_id: @calllog.typecall_id, typeconnect_id: @calllog.typeconnect_id, valuemb: @calllog.valuemb }
    assert_redirected_to calllog_path(assigns(:calllog))
  end

  test "should destroy calllog" do
    assert_difference('Calllog.count', -1) do
      delete :destroy, id: @calllog
    end

    assert_redirected_to calllogs_path
  end
end
