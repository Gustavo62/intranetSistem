# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_04_125350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "senhaPadrao", default: false
    t.boolean "isAdmin", default: false
    t.string "nome", default: ""
    t.string "cpf", default: ""
    t.boolean "acesso", default: true
    t.text "lembrete"
    t.integer "privilegio_id", default: [6], array: true
    t.integer "departamento_id", default: [5, 6], array: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "intranet_arquivos", force: :cascade do |t|
    t.bigint "intranet_arquivos_tipo_id", null: false
    t.bigint "intranet_cartorio_id", null: false
    t.boolean "ativo", default: true
    t.string "descricao"
    t.boolean "baixado"
    t.integer "cart_visualizados_ids", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["intranet_arquivos_tipo_id"], name: "index_intranet_arquivos_on_intranet_arquivos_tipo_id"
    t.index ["intranet_cartorio_id"], name: "index_intranet_arquivos_on_intranet_cartorio_id"
  end

  create_table "intranet_arquivos_tipos", force: :cascade do |t|
    t.string "descricao"
    t.boolean "ativo", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_associados", force: :cascade do |t|
    t.bigint "user_id"
    t.string "data_nascimento"
    t.string "funcao"
    t.string "nome"
    t.boolean "ativo", default: false
    t.string "cep"
    t.string "logradouro"
    t.string "complemento"
    t.string "bairro"
    t.string "telefone_1"
    t.string "telefone_2"
    t.string "celular"
    t.boolean "whatsapp"
    t.string "email"
    t.boolean "substituto", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "intranet_cartorio", array: true
    t.index ["user_id"], name: "index_intranet_associados_on_user_id"
  end

  create_table "intranet_atividades", force: :cascade do |t|
    t.string "descricao"
    t.boolean "ativo", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_avisos", force: :cascade do |t|
    t.string "titulo"
    t.string "descricao"
    t.bigint "intranet_atividade_id", array: true
    t.bigint "integer_id", array: true
    t.boolean "ativo", default: true
    t.integer "recipient_id"
    t.datetime "read_at"
    t.boolean "master", default: false
    t.integer "master_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["integer_id"], name: "index_intranet_avisos_on_integer_id"
    t.index ["intranet_atividade_id"], name: "index_intranet_avisos_on_intranet_atividade_id"
  end

  create_table "intranet_boletos", force: :cascade do |t|
    t.bigint "intranet_associado_id", null: false
    t.string "valor"
    t.date "vencimento"
    t.string "descricao"
    t.string "nosso_numero"
    t.string "status"
    t.string "codigo_de_barras"
    t.string "token"
    t.string "estornado"
    t.boolean "a_maior"
    t.string "tipo"
    t.string "metodo"
    t.string "url"
    t.integer "id_boleto"
    t.boolean "ativo", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["intranet_associado_id"], name: "index_intranet_boletos_on_intranet_associado_id"
  end

  create_table "intranet_cartorios", force: :cascade do |t|
    t.boolean "possui_cnpj", null: false
    t.string "cei"
    t.string "cnpj"
    t.string "cod_tj"
    t.string "cod_cns"
    t.string "nome"
    t.string "situacao", default: "ok", null: false
    t.string "nome_fant"
    t.string "nome_res"
    t.string "cep"
    t.string "logradouro"
    t.string "numero"
    t.string "bairro"
    t.string "complemento"
    t.string "telefone_fixo"
    t.string "telefone_celular"
    t.boolean "whatsapp"
    t.string "email"
    t.boolean "ativo", default: true
    t.string "alt_usuario"
    t.string "cad_analise"
    t.string "encontrado_tj"
    t.string "em_acordo"
    t.string "retencao_tj"
    t.string "pg_retencao_tj"
    t.text "observacao"
    t.boolean "adimplente", default: true
    t.bigint "intranet_regiao_id"
    t.bigint "intranet_contribuicao_id"
    t.bigint "intranet_entrancia_id"
    t.bigint "intranet_cidade_id"
    t.bigint "intranet_substituto_id"
    t.bigint "intranet_tabeliao_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "intranet_associado_id"
    t.integer "intranet_atividade_id", array: true
    t.index ["intranet_associado_id"], name: "index_intranet_cartorios_on_intranet_associado_id"
    t.index ["intranet_cidade_id"], name: "index_intranet_cartorios_on_intranet_cidade_id"
    t.index ["intranet_contribuicao_id"], name: "index_intranet_cartorios_on_intranet_contribuicao_id"
    t.index ["intranet_entrancia_id"], name: "index_intranet_cartorios_on_intranet_entrancia_id"
    t.index ["intranet_regiao_id"], name: "index_intranet_cartorios_on_intranet_regiao_id"
    t.index ["intranet_substituto_id"], name: "index_intranet_cartorios_on_intranet_substituto_id"
    t.index ["intranet_tabeliao_id"], name: "index_intranet_cartorios_on_intranet_tabeliao_id"
  end

  create_table "intranet_chamados", force: :cascade do |t|
    t.string "assunto"
    t.bigint "intranet_associado_id", null: false
    t.string "mensagem_pergunta"
    t.string "mensagem_resposta"
    t.integer "profissional_id"
    t.boolean "visualizada"
    t.datetime "visualizada_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["intranet_associado_id"], name: "index_intranet_chamados_on_intranet_associado_id"
  end

  create_table "intranet_cidades", force: :cascade do |t|
    t.string "municipio"
    t.string "estado"
    t.integer "cod_ibge"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_contribuicao_importadas", force: :cascade do |t|
    t.string "ano", null: false
    t.string "intranet_cartorio_id", null: false
    t.string "descContrib", null: false
    t.float "float", null: false
    t.string "documento", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_contribuicaos", force: :cascade do |t|
    t.string "descricao"
    t.boolean "ativo", default: true
    t.float "valor_base"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_departamentos", force: :cascade do |t|
    t.string "descricao"
    t.boolean "ativo", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_entrancia", force: :cascade do |t|
    t.string "descricao"
    t.boolean "ativo", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_events", force: :cascade do |t|
    t.date "periodo_ini"
    t.date "periodo_fim"
    t.date "insc_ini"
    t.date "insc_fim"
    t.string "titulo"
    t.string "cabecalho_1"
    t.string "cabecalho_2"
    t.date "data_max_pagamento"
    t.integer "qtd_insc_total"
    t.integer "qtd_insc_cart"
    t.string "tipo"
    t.boolean "ativo", default: true
    t.boolean "pago"
    t.float "valor"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_fixa_filiacaos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "intranet_cartorio_id", null: false
    t.bigint "intranet_associado_id", null: false
    t.boolean "ativo", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["intranet_associado_id"], name: "index_intranet_fixa_filiacaos_on_intranet_associado_id"
    t.index ["intranet_cartorio_id"], name: "index_intranet_fixa_filiacaos_on_intranet_cartorio_id"
    t.index ["user_id"], name: "index_intranet_fixa_filiacaos_on_user_id"
  end

  create_table "intranet_mala_direta", force: :cascade do |t|
    t.text "intranet_cartorio_id", default: [], array: true
    t.string "layout"
    t.string "assunto"
    t.string "sub_assunto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_pergunts", force: :cascade do |t|
    t.string "mensagem_pergunta"
    t.string "tipo"
    t.bigint "intranet_associado_id", null: false
    t.string "assunto"
    t.string "profissional_id"
    t.string "mensagem_resposta"
    t.string "status"
    t.boolean "visualizada", default: false
    t.datetime "visualizada_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["intranet_associado_id"], name: "index_intranet_pergunts_on_intranet_associado_id"
  end

  create_table "intranet_presencs", force: :cascade do |t|
    t.integer "m_id"
    t.string "m_name"
    t.string "ingresso_nome"
    t.boolean "pago"
    t.bigint "intranet_associado_id", null: false
    t.bigint "intranet_boleto_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["intranet_associado_id"], name: "index_intranet_presencs_on_intranet_associado_id"
    t.index ["intranet_boleto_id"], name: "index_intranet_presencs_on_intranet_boleto_id"
  end

  create_table "intranet_privilegios", force: :cascade do |t|
    t.string "descricao"
    t.boolean "ativo", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_regiaos", force: :cascade do |t|
    t.string "descricao"
    t.boolean "ativo", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_reunions", force: :cascade do |t|
    t.date "data"
    t.string "assunto"
    t.string "local"
    t.string "link"
    t.integer "intranet_cartorio_id", default: [], array: true
    t.boolean "ativo", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_substitutos", force: :cascade do |t|
    t.date "dt_inicio"
    t.date "dt_final"
    t.string "cpf"
    t.string "rg"
    t.string "nome"
    t.string "telefone"
    t.boolean "whatsapp"
    t.string "email"
    t.string "cartorio_cns"
    t.boolean "atual?"
    t.integer "cart_ref_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_tabeliaos", force: :cascade do |t|
    t.string "cpf"
    t.string "rg"
    t.string "nome"
    t.string "telefone"
    t.boolean "whatsapp"
    t.string "email"
    t.string "cartorio_cns"
    t.boolean "atual?"
    t.integer "cart_ref_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "intranet_termo_posses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "intranet_cartorio_id", null: false
    t.bigint "intranet_associado_id", null: false
    t.boolean "ativo", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["intranet_associado_id"], name: "index_intranet_termo_posses_on_intranet_associado_id"
    t.index ["intranet_cartorio_id"], name: "index_intranet_termo_posses_on_intranet_cartorio_id"
    t.index ["user_id"], name: "index_intranet_termo_posses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "senhaPadrao", default: false
    t.string "nome", default: "", null: false
    t.string "cpf", default: "", null: false
    t.boolean "acesso", default: false, null: false
    t.text "lembrete"
    t.integer "aux_cartorio_id"
    t.boolean "adimplente", default: true
    t.string "current_login_token"
    t.boolean "termo_de_uso", default: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "intranet_associados", "users"
  add_foreign_key "intranet_boletos", "intranet_associados"
  add_foreign_key "intranet_cartorios", "intranet_associados"
  add_foreign_key "intranet_cartorios", "intranet_cidades"
  add_foreign_key "intranet_cartorios", "intranet_contribuicaos"
  add_foreign_key "intranet_cartorios", "intranet_entrancia", column: "intranet_entrancia_id"
  add_foreign_key "intranet_cartorios", "intranet_regiaos"
  add_foreign_key "intranet_cartorios", "intranet_substitutos"
  add_foreign_key "intranet_cartorios", "intranet_tabeliaos"
  add_foreign_key "intranet_chamados", "intranet_associados"
  add_foreign_key "intranet_fixa_filiacaos", "intranet_associados"
  add_foreign_key "intranet_fixa_filiacaos", "intranet_cartorios"
  add_foreign_key "intranet_fixa_filiacaos", "users"
  add_foreign_key "intranet_pergunts", "intranet_associados"
  add_foreign_key "intranet_presencs", "intranet_associados"
  add_foreign_key "intranet_presencs", "intranet_boletos"
  add_foreign_key "intranet_termo_posses", "intranet_associados"
  add_foreign_key "intranet_termo_posses", "intranet_cartorios"
  add_foreign_key "intranet_termo_posses", "users"
end
