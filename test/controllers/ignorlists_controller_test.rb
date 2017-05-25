require 'test_helper'

class IgnorlistsControllerTest < ActionController::TestCase
  setup do
    @ignorlist = ignorlists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ignorlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ignorlist" do
    assert_difference('Ignorlist.count') do
      post :create, ignorlist: { schedule_id: @ignorlist.schedule_id, station_id: @ignorlist.station_id }
    end

    assert_redirected_to ignorlist_path(assigns(:ignorlist))
  end

  test "should show ignorlist" do
    get :show, id: @ignorlist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ignorlist
    assert_response :success
  end

  test "should update ignorlist" do
    patch :update, id: @ignorlist, ignorlist: { schedule_id: @ignorlist.schedule_id, station_id: @ignorlist.station_id }
    assert_redirected_to ignorlist_path(assigns(:ignorlist))
  end

  test "should destroy ignorlist" do
    assert_difference('Ignorlist.count', -1) do
      delete :destroy, id: @ignorlist
    end

    assert_redirected_to ignorlists_path
  end
end
