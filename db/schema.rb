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

ActiveRecord::Schema.define(version: 20140414111905) do

  create_table "contests", force: true do |t|
    t.string   "contestName"
    t.datetime "startDateTime"
    t.datetime "endDateTime"
    t.string   "contestStatus"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contests", ["user_id"], name: "index_contests_on_user_id"

  create_table "participants", force: true do |t|
    t.decimal  "score"
    t.integer  "contest_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["contest_id"], name: "index_participants_on_contest_id"
  add_index "participants", ["user_id"], name: "index_participants_on_user_id"

  create_table "problem_in_contests", force: true do |t|
    t.integer  "problem_id"
    t.integer  "contest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "problem_in_contests", ["contest_id"], name: "index_problem_in_contests_on_contest_id"
  add_index "problem_in_contests", ["problem_id"], name: "index_problem_in_contests_on_problem_id"

  create_table "problems", force: true do |t|
    t.string   "title"
    t.decimal  "timeLimit"
    t.decimal  "sourceLimit"
    t.date     "dateAdded"
    t.text     "problemStatement"
    t.text     "solutionFile"
    t.text     "testFile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  create_table "submissions", force: true do |t|
    t.string   "languageUsed"
    t.datetime "dateTimeOfSubmission"
    t.decimal  "timeTaken"
    t.decimal  "memoryUsed"
    t.text     "submissionFile"
    t.text     "status"
    t.integer  "user_id"
    t.integer  "problem_id"
    t.integer  "contest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submissions", ["contest_id"], name: "index_submissions_on_contest_id"
  add_index "submissions", ["problem_id"], name: "index_submissions_on_problem_id"
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "name"
    t.date     "dateOfBirth"
    t.string   "country"
    t.text     "aboutMe"
    t.decimal  "ranking"
    t.text     "institution"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
