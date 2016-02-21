require 'test_helper'

class ItensControllerTest < ActionController::TestCase
  setup do
    @iten = itens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iten" do
    assert_difference('Iten.count') do
      post :create, iten: { produto_id: @iten.produto_id, quantidade: @iten.quantidade, quantidademinima: @iten.quantidademinima }
    end

    assert_redirected_to iten_path(assigns(:iten))
  end

  test "should show iten" do
    get :show, id: @iten
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iten
    assert_response :success
  end

  test "should update iten" do
    patch :update, id: @iten, iten: { produto_id: @iten.produto_id, quantidade: @iten.quantidade, quantidademinima: @iten.quantidademinima }
    assert_redirected_to iten_path(assigns(:iten))
  end

  test "should destroy iten" do
    assert_difference('Iten.count', -1) do
      delete :destroy, id: @iten
    end

    assert_redirected_to itens_path
  end
end
