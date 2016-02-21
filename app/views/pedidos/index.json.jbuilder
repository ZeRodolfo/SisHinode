json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :iten_id, :cliente_id, :quantidade, :valortotal, :datapedido
  json.url pedido_url(pedido, format: :json)
end
