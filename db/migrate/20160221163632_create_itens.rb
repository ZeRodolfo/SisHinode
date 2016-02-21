class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
      t.references :produto, index: true, foreign_key: true
      t.integer :quantidade
      t.integer :quantidademinima

      t.timestamps null: false
    end
  end
end
