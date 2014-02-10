require 'test_helper'

class VillainsControllerTest < ActionController::TestCase
  setup do
    @villain = villains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:villains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create villain" do
    assert_difference('Villain.count') do
#		puts @villain.gender
      post :create, villain: { combat: @villain.combat, durab: @villain.durab, gender: @villain.gender, image_url: @villain.image_url, intel: @villain.intel, name: @villain.name, power: @villain.power, speed: @villain.speed, str: @villain.str }
    end

    assert_redirected_to villain_path(assigns(:villain))
  end

  test "should show villain" do
    get :show, id: @villain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @villain
    assert_response :success
  end

  test "should update villain" do
    patch :update, id: @villain, villain: { combat: @villain.combat, durab: @villain.durab, gender: @villain.gender, image_url: @villain.image_url, intel: @villain.intel, name: @villain.name, power: @villain.power, speed: @villain.speed, str: @villain.str }
    assert_redirected_to villain_path(assigns(:villain))
  end

  test "should destroy villain" do
    assert_difference('Villain.count', -1) do
      delete :destroy, id: @villain
    end

    assert_redirected_to villains_path
  end
end
