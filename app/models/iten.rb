class Iten < ActiveRecord::Base
  belongs_to :produto
  has_many :pedidos
end
