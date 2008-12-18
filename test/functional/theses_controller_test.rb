require 'test_helper'

class ThesesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:theses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_thesis
    assert_difference('Thesis.count') do
      post :create, :thesis => { }
    end

    assert_redirected_to thesis_path(assigns(:thesis))
  end

  def test_should_show_thesis
    get :show, :id => theses(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => theses(:one).id
    assert_response :success
  end

  def test_should_update_thesis
    put :update, :id => theses(:one).id, :thesis => { }
    assert_redirected_to thesis_path(assigns(:thesis))
  end

  def test_should_destroy_thesis
    assert_difference('Thesis.count', -1) do
      delete :destroy, :id => theses(:one).id
    end

    assert_redirected_to theses_path
  end
end
