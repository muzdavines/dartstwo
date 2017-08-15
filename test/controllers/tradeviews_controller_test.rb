require 'test_helper'

class TradeviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tradeview = tradeviews(:one)
  end

  test "should get index" do
    get tradeviews_url
    assert_response :success
  end

  test "should get new" do
    get new_tradeview_url
    assert_response :success
  end

  test "should create tradeview" do
    assert_difference('Tradeview.count') do
      post tradeviews_url, params: { tradeview: {  } }
    end

    assert_redirected_to tradeview_url(Tradeview.last)
  end

  test "should show tradeview" do
    get tradeview_url(@tradeview)
    assert_response :success
  end

  test "should get edit" do
    get edit_tradeview_url(@tradeview)
    assert_response :success
  end

  test "should update tradeview" do
    patch tradeview_url(@tradeview), params: { tradeview: {  } }
    assert_redirected_to tradeview_url(@tradeview)
  end

  test "should destroy tradeview" do
    assert_difference('Tradeview.count', -1) do
      delete tradeview_url(@tradeview)
    end

    assert_redirected_to tradeviews_url
  end
end
