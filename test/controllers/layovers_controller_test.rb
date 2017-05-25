require 'test_helper'

class LayoversControllerTest < ActionController::TestCase
  setup do
    @layover = layovers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:layovers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create layover" do
    assert_difference('Layover.count') do
      post :create, layover: { arrive_time: @layover.arrive_time, schedule_id: @layover.schedule_id, station_id: @layover.station_id }
    end

    assert_redirected_to layover_path(assigns(:layover))
  end

  test "should show layover" do
    get :show, id: @layover
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @layover
    assert_response :success
  end

  test "should update layover" do
    patch :update, id: @layover, layover: { arrive_time: @layover.arrive_time, schedule_id: @layover.schedule_id, station_id: @layover.station_id }
    assert_redirected_to layover_path(assigns(:layover))
  end

  test "should destroy layover" do
    assert_difference('Layover.count', -1) do
      delete :destroy, id: @layover
    end

    assert_redirected_to layovers_path
  end
end
