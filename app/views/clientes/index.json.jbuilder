json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nome, :cpf, :telefone, :email, :endereco
  json.url cliente_url(cliente, format: :json)
end
