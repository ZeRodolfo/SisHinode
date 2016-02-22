class Iten < ActiveRecord::Base
  belongs_to :produto
  has_many :pedidos

  def get_produto_nome
     "#{produto.nome}"
  end
end
