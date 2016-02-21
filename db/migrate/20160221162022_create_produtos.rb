class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :descricao
      t.decimal :precounitario
      t.integer :serie

      t.timestamps null: false
    end
  end
end
