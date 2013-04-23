require 'test_helper'

class OutMessagesControllerTest < ActionController::TestCase
  setup do
    @out_message = out_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:out_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create out_message" do
    assert_difference('OutMessage.count') do
      post :create, out_message: { direction: @out_message.direction, error-text: @out_message.error-text, from: @out_message.from, in_messsage_id: @out_message.in_messsage_id, message_date: @out_message.message_date, message_id: @out_message.message_id, status: @out_message.status, text: @out_message.text, timestamp: @out_message.timestamp, to: @out_message.to, type: @out_message.type }
    end

    assert_redirected_to out_message_path(assigns(:out_message))
  end

  test "should show out_message" do
    get :show, id: @out_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @out_message
    assert_response :success
  end

  test "should update out_message" do
    put :update, id: @out_message, out_message: { direction: @out_message.direction, error-text: @out_message.error-text, from: @out_message.from, in_messsage_id: @out_message.in_messsage_id, message_date: @out_message.message_date, message_id: @out_message.message_id, status: @out_message.status, text: @out_message.text, timestamp: @out_message.timestamp, to: @out_message.to, type: @out_message.type }
    assert_redirected_to out_message_path(assigns(:out_message))
  end

  test "should destroy out_message" do
    assert_difference('OutMessage.count', -1) do
      delete :destroy, id: @out_message
    end

    assert_redirected_to out_messages_path
  end
end
