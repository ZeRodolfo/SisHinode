class Pedido < ActiveRecord::Base
  belongs_to :iten
  belongs_to :cliente
end
