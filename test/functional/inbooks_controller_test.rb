require 'test_helper'

class InbooksControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:inbooks)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_inbook
    assert_difference('Inbook.count') do
      post :create, :inbook => { }
    end

    assert_redirected_to inbook_path(assigns(:inbook))
  end

  def test_should_show_inbook
    get :show, :id => inbooks(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => inbooks(:one).id
    assert_response :success
  end

  def test_should_update_inbook
    put :update, :id => inbooks(:one).id, :inbook => { }
    assert_redirected_to inbook_path(assigns(:inbook))
  end

  def test_should_destroy_inbook
    assert_difference('Inbook.count', -1) do
      delete :destroy, :id => inbooks(:one).id
    end

    assert_redirected_to inbooks_path
  end
end
