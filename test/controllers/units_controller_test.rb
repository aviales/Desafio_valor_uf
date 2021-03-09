require 'test_helper'

class UnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit = units(:one)
  end

  test "should get index" do
    get units_url, as: :json
    assert_response :success
  end

  test "should create unit" do
    assert_difference('Unit.count') do
      post units_url, params: { unit: { date: @unit.date, value: @unit.value } }, as: :json
    end

    assert_response 201
  end

  test "should show unit" do
    get unit_url(@unit), as: :json
    assert_response :success
  end

  test "should update unit" do
    patch unit_url(@unit), params: { unit: { date: @unit.date, value: @unit.value } }, as: :json
    assert_response 200
  end

  test "should destroy unit" do
    assert_difference('Unit.count', -1) do
      delete unit_url(@unit), as: :json
    end

    assert_response 204
  end
end
