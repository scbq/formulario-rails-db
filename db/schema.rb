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

ActiveRecord::Schema[7.2].define(version: 2024_09_12_002341) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "plpgsql"

  create_table "peliculas", primary_key: "id_pelicula", id: :serial, force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "genero", limit: 50
  end

  create_table "peliculastags", primary_key: ["id_pelicula", "id_tag"], force: :cascade do |t|
    t.integer "id_pelicula", null: false
    t.integer "id_tag", null: false
  end

  create_table "preguntas", primary_key: "id_pregunta", id: :serial, force: :cascade do |t|
    t.text "pregunta", null: false
    t.text "respuesta_correcta", null: false
  end

  create_table "respuestas", primary_key: "id_respuesta", id: :serial, force: :cascade do |t|
    t.integer "id_pregunta"
    t.integer "id_usuario"
    t.text "respuesta"
  end

  create_table "tags", primary_key: "id_tag", id: :serial, force: :cascade do |t|
    t.string "descripcion", limit: 100
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
    t.string "email"
  end

  create_table "usuarios", primary_key: "id_usuario", id: :serial, force: :cascade do |t|
    t.string "nombre", limit: 100
    t.date "fecha_nacimiento"
    t.string "email", limit: 255

    t.check_constraint "fecha_nacimiento <= (CURRENT_DATE - 'P18Y'::interval)", name: "usuarios_fecha_nacimiento_check"
    t.unique_constraint ["email"], name: "usuarios_email_key"
  end

  add_foreign_key "peliculastags", "peliculas", column: "id_pelicula", primary_key: "id_pelicula", name: "peliculastags_id_pelicula_fkey"
  add_foreign_key "peliculastags", "tags", column: "id_tag", primary_key: "id_tag", name: "peliculastags_id_tag_fkey"
  add_foreign_key "respuestas", "preguntas", column: "id_pregunta", primary_key: "id_pregunta", name: "respuestas_id_pregunta_fkey"
  add_foreign_key "respuestas", "usuarios", column: "id_usuario", primary_key: "id_usuario", name: "respuestas_id_usuario_fkey", on_delete: :cascade
end
