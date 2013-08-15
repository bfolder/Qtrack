require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    user = User.first
    sign_in user
    user.role = Role.last
    user.save
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, user: { name: 'testuser', email: 'testuser@user.com', password: 'test123', password_confirmation: 'test123' }
    end

    assert_redirected_to users_path
  end

  test 'should get edit' do
    get :edit, id: User.first
    assert_response :success
  end

  test 'should update user' do
    put :update, id: User.first, user: { name: 'updateduser' }
    assert_redirected_to edit_user_path(User.first)
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete :destroy, id: User.last
    end

    assert_redirected_to users_url
  end
end