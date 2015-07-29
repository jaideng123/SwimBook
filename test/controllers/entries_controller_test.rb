require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  def encoded_auth_credentials
  username = ENV['GEN_USERNAME']
  password = ENV['GEN_PASSWORD']

  ActionController::HttpAuthentication::Basic
    .encode_credentials(username, password)
end

def http_login
  request.env['HTTP_AUTHORIZATION'] = encoded_auth_credentials
end
  setup do
    http_login
    @entry = entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create Entry" do
    assert_difference('Entry.count') do
      post :create, entry: { age: @entry.age, fname: @entry.fname, guard: @entry.guard, lname: @entry.lname, parent: @entry.parent, pink: @entry.pink, yellow: @entry.yellow, tested: @entry.tested }
    end

    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should show Entry" do
    get :show, id: @entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entry
    assert_response :success
  end

  test "should update Entry" do
    patch :update, id: @entry, entry:{ age: @entry.age, fname: @entry.fname, guard: @entry.guard, lname: @entry.lname, parent: @entry.parent, pink: @entry.pink, yellow: @entry.yellow, tested: @entry.tested }
    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should destroy Entry" do
    assert_difference('Entry.count', -1) do
      delete :destroy, id: @entry
    end

    assert_redirected_to entries_path
  end
end
