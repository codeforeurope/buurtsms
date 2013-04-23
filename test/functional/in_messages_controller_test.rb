require 'test_helper'

class InMessagesControllerTest < ActionController::TestCase
  setup do
    @in_message = in_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_message" do
    assert_difference('InMessage.count') do
      post :create, in_message: { concat: @in_message.concat, concat_part: @in_message.concat_part, concat_ref: @in_message.concat_ref, concat_total: @in_message.concat_total, message_id: @in_message.message_id, message_timestamp: @in_message.message_timestamp, msisdn: @in_message.msisdn, network_code: @in_message.network_code, status: @in_message.status, text: @in_message.text, to: @in_message.to, type: @in_message.type }
    end

    assert_redirected_to in_message_path(assigns(:in_message))
  end

  test "should show in_message" do
    get :show, id: @in_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_message
    assert_response :success
  end

  test "should update in_message" do
    put :update, id: @in_message, in_message: { concat: @in_message.concat, concat_part: @in_message.concat_part, concat_ref: @in_message.concat_ref, concat_total: @in_message.concat_total, message_id: @in_message.message_id, message_timestamp: @in_message.message_timestamp, msisdn: @in_message.msisdn, network_code: @in_message.network_code, status: @in_message.status, text: @in_message.text, to: @in_message.to, type: @in_message.type }
    assert_redirected_to in_message_path(assigns(:in_message))
  end

  test "should destroy in_message" do
    assert_difference('InMessage.count', -1) do
      delete :destroy, id: @in_message
    end

    assert_redirected_to in_messages_path
  end
end
