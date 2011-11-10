require 'test_helper'

class LeaveFormsControllerTest < ActionController::TestCase
  setup do
    @leave_form = leave_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_form" do
    assert_difference('LeaveForm.count') do
      post :create, :leave_form => @leave_form.attributes
    end

    assert_redirected_to leave_form_path(assigns(:leave_form))
  end

  test "should show leave_form" do
    get :show, :id => @leave_form.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @leave_form.to_param
    assert_response :success
  end

  test "should update leave_form" do
    put :update, :id => @leave_form.to_param, :leave_form => @leave_form.attributes
    assert_redirected_to leave_form_path(assigns(:leave_form))
  end

  test "should destroy leave_form" do
    assert_difference('LeaveForm.count', -1) do
      delete :destroy, :id => @leave_form.to_param
    end

    assert_redirected_to leave_forms_path
  end
end
