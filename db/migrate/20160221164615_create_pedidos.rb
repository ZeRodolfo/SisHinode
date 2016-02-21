class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.references :iten, index: true, foreign_key: true
      t.references :cliente, index: true, foreign_key: true
      t.integer :quantidade
      t.decimal :valortotal
      t.datetime :datapedido

      t.timestamps null: false
    end
  end
end
