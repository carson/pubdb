require 'test_helper'

class MiscsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:miscs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_misc
    assert_difference('Misc.count') do
      post :create, :misc => { }
    end

    assert_redirected_to misc_path(assigns(:misc))
  end

  def test_should_show_misc
    get :show, :id => miscs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => miscs(:one).id
    assert_response :success
  end

  def test_should_update_misc
    put :update, :id => miscs(:one).id, :misc => { }
    assert_redirected_to misc_path(assigns(:misc))
  end

  def test_should_destroy_misc
    assert_difference('Misc.count', -1) do
      delete :destroy, :id => miscs(:one).id
    end

    assert_redirected_to miscs_path
  end
end
