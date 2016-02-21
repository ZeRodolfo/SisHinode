# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160221164615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "telefone"
    t.string   "email"
    t.string   "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itens", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "quantidade"
    t.integer  "quantidademinima"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "itens", ["produto_id"], name: "index_itens_on_produto_id", using: :btree

  create_table "pedidos", force: :cascade do |t|
    t.integer  "iten_id"
    t.integer  "cliente_id"
    t.integer  "quantidade"
    t.decimal  "valortotal"
    t.datetime "datapedido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pedidos", ["cliente_id"], name: "index_pedidos_on_cliente_id", using: :btree
  add_index "pedidos", ["iten_id"], name: "index_pedidos_on_iten_id", using: :btree

  create_table "produtos", force: :cascade do |t|
    t.string   "nome"
    t.string   "descricao"
    t.decimal  "precounitario"
    t.integer  "serie"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "itens", "produtos"
  add_foreign_key "pedidos", "clientes"
  add_foreign_key "pedidos", "itens"
end
