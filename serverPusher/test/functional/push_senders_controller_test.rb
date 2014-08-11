require 'test_helper'

class PushSendersControllerTest < ActionController::TestCase
  setup do
    @push_sender = push_senders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:push_senders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create push_sender" do
    assert_difference('PushSender.count') do
      post :create, push_sender: { text: @push_sender.text, url: @push_sender.url }
    end

    assert_redirected_to push_sender_path(assigns(:push_sender))
  end

  test "should show push_sender" do
    get :show, id: @push_sender
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @push_sender
    assert_response :success
  end

  test "should update push_sender" do
    put :update, id: @push_sender, push_sender: { text: @push_sender.text, url: @push_sender.url }
    assert_redirected_to push_sender_path(assigns(:push_sender))
  end

  test "should destroy push_sender" do
    assert_difference('PushSender.count', -1) do
      delete :destroy, id: @push_sender
    end

    assert_redirected_to push_senders_path
  end
end
