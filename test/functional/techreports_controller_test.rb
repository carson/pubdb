require 'test_helper'

class TechreportsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:techreports)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_techreport
    assert_difference('Techreport.count') do
      post :create, :techreport => { }
    end

    assert_redirected_to techreport_path(assigns(:techreport))
  end

  def test_should_show_techreport
    get :show, :id => techreports(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => techreports(:one).id
    assert_response :success
  end

  def test_should_update_techreport
    put :update, :id => techreports(:one).id, :techreport => { }
    assert_redirected_to techreport_path(assigns(:techreport))
  end

  def test_should_destroy_techreport
    assert_difference('Techreport.count', -1) do
      delete :destroy, :id => techreports(:one).id
    end

    assert_redirected_to techreports_path
  end
end
