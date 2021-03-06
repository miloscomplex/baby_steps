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

ActiveRecord::Schema.define(version: 20201004041325) do

  create_table "care_givers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  create_table "children", force: :cascade do |t|
    t.string  "name"
    t.string  "birthdate"
    t.string  "gender"
    t.integer "care_giver_id"
  end

  create_table "logs", force: :cascade do |t|
    t.integer "child_id"
    t.string  "first_nap_time"
    t.string  "first_nap_duration"
    t.string  "second_nap_time"
    t.string  "second_nap_duration"
    t.integer "wet_diapers"
    t.integer "solied_diapers"
    t.string  "first_feeding"
    t.string  "second_feeding"
    t.string  "third_feeding"
    t.boolean "art_and_crafts"
    t.boolean "gym_time"
    t.boolean "independent_play_time"
    t.boolean "music_time"
    t.boolean "story_time"
    t.boolean "tummy_time"
    t.boolean "sensory_play_time"
    t.string  "notes"
  end

end
