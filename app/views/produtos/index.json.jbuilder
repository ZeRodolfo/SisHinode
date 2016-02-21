json.array!(@produtos) do |produto|
  json.extract! produto, :id, :nome, :descricao, :precounitario, :serie
  json.url produto_url(produto, format: :json)
end
