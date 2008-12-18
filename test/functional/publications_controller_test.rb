require 'test_helper'

class PublicationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:publications)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_publication
    assert_difference('Publication.count') do
      post :create, :publication => { }
    end

    assert_redirected_to publication_path(assigns(:publication))
  end

  def test_should_show_publication
    get :show, :id => publications(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => publications(:one).id
    assert_response :success
  end

  def test_should_update_publication
    put :update, :id => publications(:one).id, :publication => { }
    assert_redirected_to publication_path(assigns(:publication))
  end

  def test_should_destroy_publication
    assert_difference('Publication.count', -1) do
      delete :destroy, :id => publications(:one).id
    end

    assert_redirected_to publications_path
  end
end
