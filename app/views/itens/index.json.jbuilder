json.array!(@itens) do |iten|
  json.extract! iten, :id, :produto_id, :quantidade, :quantidademinima
  json.url iten_url(iten, format: :json)
end
