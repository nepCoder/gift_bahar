require "test_helper"

class Api::V1::GiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_gift = api_v1_gifts(:one)
  end

  test "should get index" do
    get api_v1_gifts_url, as: :json
    assert_response :success
  end

  test "should create api_v1_gift" do
    assert_difference("Api::V1::Gift.count") do
      post api_v1_gifts_url, params: { api_v1_gift: { description: @api_v1_gift.description, name: @api_v1_gift.name } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_gift" do
    get api_v1_gift_url(@api_v1_gift), as: :json
    assert_response :success
  end

  test "should update api_v1_gift" do
    patch api_v1_gift_url(@api_v1_gift), params: { api_v1_gift: { description: @api_v1_gift.description, name: @api_v1_gift.name } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_gift" do
    assert_difference("Api::V1::Gift.count", -1) do
      delete api_v1_gift_url(@api_v1_gift), as: :json
    end

    assert_response :no_content
  end
end
