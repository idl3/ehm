ActiveRecord::Schema.define(:version => 20120301201016) do

  create_table "offers", :force => true do |t|
    t.string   "title"
    t.decimal  "price"
    t.integer  "vendor_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vendors", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "vendors", ["email"], :name => "index_vendors_on_email", :unique => true
  add_index "vendors", ["remember_token"], :name => "index_vendors_on_remember_token"
  add_index "vendors", ["username"], :name => "index_vendors_on_username", :unique => true

end