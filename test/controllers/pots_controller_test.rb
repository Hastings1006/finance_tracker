require "test_helper"

class PotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pots_index_url
    assert_response :success
  end

  test "should get show" do
    get pots_show_url
    assert_response :success
  end

  test "should get new" do
    get pots_new_url
    assert_response :success
  end

  test "should get create" do
    get pots_create_url
    assert_response :success
  end

  test "should get edit" do
    get pots_edit_url
    assert_response :success
  end

  test "should get update" do
    get pots_update_url
    assert_response :success
  end

  test "should get destroy" do
    get pots_destroy_url
    assert_response :success
  end
end
